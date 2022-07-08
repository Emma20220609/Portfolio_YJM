# from pandas import DataFrame
from bs4 import BeautifulSoup
import DBManager as DB
import re

datalist=[]

# raw_no       DB 원본 일련번호  (필수)
# rec_name     사이트명          (필수)
# com_name     업체명            (필수)
# contents_URL 공고글주소        (필수)
# content      공고글내용[text]  (필수)
# details_raw  모집상세원본[tag] (필수)

def recParse(rec_name) :
    db = DB.DBManager()
    db.setWhere("rec_name", rec_name)

    list = db.GetList("recRaw")

    for line in list :
        soup = BeautifulSoup(line["content_raw"], "html.parser")
        Target_txt = soup.select("#contents > div > div.careers-area")
        for MainTXT in Target_txt :
            #==========================================================
            # |공고일자 rec_date|
            rec_date      = MainTXT.select_one('div.careers-table.center.qr > table > tbody > tr > td:nth-child(1)').text.replace(".", "-")
            
            # |제목 title|
            title         = MainTXT.select_one('div.careers-new > div.border > div.left > div.tit-area > p').text
            
            # |내용 content text형식|
            content       = MainTXT.text
            
            # |신입경력 career| - 문제 발생, 시간 오래걸림
            # career        = MainTXT.select('div.careers-new > div.border > div.left > div:nth-child(2) > div:nth-child(1) > div > ul > li:nth-child(1)')
            
            # # |급여구분 pay_type| - ← 이해 못함, 월급 단위? 그런 거라면 없음.
            # pay_type    = MainTXT.select_one('div:nth-child(4) > table > tbody').text

            # |급여금액 pay| - 문제 발생 급여가 범위 형식임
            # pay           = MainTXT.select_one('div.careers-new > div.border > div.left > div:nth-child(2) > div:nth-child(2) > div > ul > li:nth-child(2) > span').text.strip()

            # |모집인원 recruit_count|
            recruit_count = MainTXT.select_one('div:nth-child(5) > table > tbody > tr > td:nth-child(4)').text.strip().replace("입사지원현황통계", "")
            recruit_count = int(re.sub(r'[^0-9]', '', recruit_count))
            
            # |모집공고 details_raw|
            # Tag 형식 붙여넣기가 불가능 해서 어쩔 수 없이 str로 넣음
            soup = BeautifulSoup(line["content_raw"], "html.parser")
            details_raw  = str(MainTXT.select_one('div:nth-child(4)').text)
            details_raw += str(MainTXT.select_one('div:nth-child(5)').text)
            details_raw += str(MainTXT.select_one('div:nth-child(6)').text)
            # ==========================================================

# 선 db데이터/ 후 공고 데이터
            titdata = {
                #DB에서 읽어온 정보
                'raw_no'       : line["raw_no"],
                'get_date'     : line["get_date"],
                'rec_name'     : line["rec_name"] ,
                'com_name'     : line["com_name"],
                'contents_URL' : line["contents_URL"],
                
                # content_raw"에서 파싱한 정보
                'rec_date'        :rec_date,
                'title'           :title,
                'content'         :content,
                # 'career'        :career,
                # 'pay_type'      :pay_type,
                # 'pay'           :pay,
                'recruit_count'   :recruit_count,
                'details_raw'     :details_raw
                # 'view' : hit,  조회수는 가져올 수 있는데 DB 테이블이 없음.
            }
            datalist.append(titdata)
            
    db = DB.DBManager()
    db.SetList("recList",datalist)


    # #데이터 프레임 넣기
    # df = DataFrame(datalist)
    # #csv 파일로 저장한다.
    # filename = 'D:\\2nd-Project\\2nd Project\\park\\220628\\2. 워크넷_url, 실제파일, 분석자료_0622\\2worknet_list.csv'
    # df.to_csv(filename, encoding="utf-8-sig", index=False)
    # print('D:\\2nd-Project\\2nd Project\\park\\220628\\2. 워크넷_url, 실제파일, 분석자료_0622\\2worknet_list.csv에 저장을 완료했습니다.★')


# 크롤링 사이트
recParse("WORK_NET")




# ↓ 라인 정상 작동 확인 용도 ↓
#             print(rec_date)
# recParse("WORK_NET")

            # |조회수 view|
            # hit         = MainTXT.select_one('div.a-r.mt05')
            
            
#             print('*'*30)
#             print('raw_no',type(line["raw_no"]))
#             print('get_date',type(line["get_date"]))
#             print('rec_name',type(line["rec_name"]))
#             print('com_name',type(line["com_name"]))
#             print('contents_URL',type(line["contents_URL"]))
#             print('content_raw',type(line["content_raw"]))
            
#             # print('rec_date',type(rec_date))
#             print('title',type(title))
#             print('content',type(content))
#             # print('career',type(career))
#             # print('pay',type(pay))
#             print('recruit_count',type(recruit_count))
# recParse("WORK_NET")