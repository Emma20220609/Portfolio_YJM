from pandas import DataFrame
from bs4 import BeautifulSoup
import DBManager as DB
import re

datalist=[]

# analysis_no       DB 원본 일련번호  (필수)
# analysis_date

# list_no           리스트 일련번호   (필수)
# rec_name          사이트명          (필수)
# com_name          업체명            (필수)
# contents_URL      공고글주소        (필수)
# content           공고글내용[text]  (필수)
# details           모집상세원본[tag] (필수)

def rec_Analize(rec_name) :
    db = DB.DBManager()
    db.setWhere("rec_name", rec_name)

    list = db.GetList("recList")

    if list != None :
        for line in list :
            soup = BeautifulSoup(line["content"], "html.parser")
            Target_txt = soup.select("#contents > div > div.careers-area")
            for MainTXT in Target_txt :
                #=============================================================
                # 1.|사업자번호 com_number - VARCHAR(255)|
                
                # 2.|업체사이트주소 com_URL - TEXT형식|
                com_URL = MainTXT.select_one('div.careers-new > div.border > div.right > div.info > ul > li:nth-child(6) > div').text
                
                # 3.|지원인원 volunteer_count - INT|
                volunteer_count = MainTXT.select_one('div.emp-application > div.top > div.count > a > p.futura.font-blue2')
                if volunteer_count != None :
                    volunteer_count = int(volunteer_count.text)

                # 4.|채용인원 emply_count - INT|
                emply_count = MainTXT.select_one('div.careers-new > div.border > div.right > div.info > ul > li:nth-child(7) > div').text
                emply_count = int(re.sub(r'[^0-9]', '', emply_count))

                # 5.|조회수 view - INT|
                view = MainTXT.select_one('div.a-r.mt05').text
                view = int(re.sub(r'[^0-9]', '', view))
                
                # 6.|마감여부 closing - BOOLEAN|
                #===================================
                # 7.|stack_1 C - BOOLEAN|
                # 8.|stack_2 C++|
                # 9.|stack_3 C#|
                # 10.|stack_4 JAVA|
                # 11.|stack_5 JS|
                # 12.|stack_6 PYTHON|
                # 13.|stack_7 VB|
                # 14.|stack_etc ETC_lang| - LONGTEXT
                #===================================
                # 15.|word_list 워드리스트|
                # 16.|word_net 워드넷|
                # 17.|ETC 기타사항|
                #=============================================================

                # 선 db데이터/ 후 공고 데이터
                titdata = {
                    # DB에서 읽어온 정보
                    'list_no'       : line["list_no"],
                    'get_date'      : line["get_date"],
                    'parse_date'    : line["parse_date"] ,
                    'rec_date'      : line["rec_date"],
                    'rec_name'      : line["rec_name"],
                    'com_name'      : line["com_name"],
                    'contents_URL'  : line["contents_URL"],
                    'title'         : line["title"],
                    'content'       : line["content"],
                    'details'       : line["details_raw"],
                    'career'        : line["career"],
                    'pay_type'      : line["pay_type"],
                    'pay'           : line["pay"],
                    'recruit_count' : line["recruit_count"],
                    
                    # 'content'에서 파싱한 정보
                    'com_URL'         :com_URL,
                    'volunteer_count' :volunteer_count,
                    'emply_count'     :emply_count,
                    'view'            :view
                }
                datalist.append(titdata)
            
    # db = DB.DBManager()
    # db.SetList("recList",datalist)

    #데이터 프레임 넣기
    df = DataFrame(datalist)
    #csv 파일로 저장한다.
    filename = 'D:\\2nd-Project\\2nd Project\\park\\220628\\2. 워크넷_url, 실제파일, 분석자료_0622\\2worknet_list.csv'
    df.to_csv(filename, encoding="utf-8-sig", index=False)
    print('D:\\2nd-Project\\2nd Project\\park\\220628\\2. 워크넷_url, 실제파일, 분석자료_0622\\2worknet_list.csv에 저장을 완료했습니다.★')

# 크롤링 사이트
rec_Analize("WORK_NET")


# ↓ 라인 정상 작동 확인 용도 ↓
#             print(rec_date)
# rec_Analize("WORK_NET")


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