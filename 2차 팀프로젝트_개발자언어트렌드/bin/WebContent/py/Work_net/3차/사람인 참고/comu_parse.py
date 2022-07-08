from bs4 import BeautifulSoup
import DBManager as DB

datalist=[]

def recParse(rec_name) :

    db = DB.DBManager()
    db.setWhere("rec_name", rec_name)

    list = db.GetList("recRaw")

    datalist = []
    #contents > div > div.careers-area > 
    for line in list :
        soup = BeautifulSoup(line["content_raw"], "html.parser")
        Target_txt = soup.select("#contents > div > div.careers-area")
        for MainTXT in Target_txt :
            # |공고일자 rec_date|
            rec_date      = MainTXT.select_one('div.careers-table.center.qr > table > tbody > tr > td:nth-child(1)').text.replace(".", "-")
            
            # |제목 title|
            title         = MainTXT.select_one('div.careers-new > div.border > div.left > div.tit-area > p').text
            
            # |내용 content|
            content       = MainTXT.select_one('div:nth-child(4) > table > tbody').text
            
            # |신입경력 career|
            career        = MainTXT.select_one('div.careers-new > div.border > div.left > div:nth-child(2) > div:nth-child(1) > div > ul > li:nth-child(1)').text.strip()
            
            # # |급여구분 pay_type| - ← 이해 못함, 월급 단위? 그런 거라면 없음.
            # pay_type    = MainTXT.select_one('div:nth-child(4) > table > tbody').text

            # |급여금액 pay|
            pay           = MainTXT.select_one('div:nth-child(8) > table > tbody > tr > td:nth-child(1)').text.strip()

            # |모집인원 recruit_count|
            recruit_count = MainTXT.select_one('div:nth-child(5) > table > tbody > tr > td:nth-child(4)').text.strip().replace("입사지원현황통계", "")



            titdata = {
                #DB에서 읽어온 정보
                'raw_no'       : line["raw_no"],
                'get_date'     : line["get_date"],
                'rec_name'     : line["rec_name"] ,
                'com_name'     : line["com_name"],
                'contents_URL' : line["contents_URL"], # ← 변수 문제 URL contents이고 원본 데이터는 content와 detail, 커뮤니티는 contents 등으로 변수가 달라 헷갈림.
                'details_raw'  : line["content_raw"], # ← 변수 문제 details_raw, content_raw
                
                # content_raw"에서 파싱한 정보
                # 'rec_date'        :rec_date,
                'title'           :title,
                'content'         :content,
                'career'          :career,
                'pay'             :pay,
                'recruit_count'   :recruit_count
                # 'view' : hit,  조회수는 있는데 DB 테이블이 없음.
                }
            
            datalist.append(titdata)

        db = DB.DBManager()
        db.SetList("recList",datalist)


# 크롤링 사이트
recParse("WORK_NET")


# ↓ 라인 정상 작동 확인 용도 ↓
#             print(rec_date)
# recParse("WORK_NET")

            # |조회수 view|
            # hit         = MainTXT.select_one('div.a-r.mt05')
            
            
#             print(type(line["raw_no"]))
#             print(type(line["get_date"]))
#             print(type(line["rec_name"]))
#             print(type(line["com_name"]))
#             print(type(line["contents_URL"]))
#             print(type(line["content_raw"]))
            
#             print(type(rec_date))
#             print(type(title))
#             print(type(content))
#             print(type(career))
#             print(type(pay))
#             print(type(recruit_count))
# recParse("WORK_NET")
