from bs4 import BeautifulSoup
import DBManager as DB
import re

def recParse(rec_name) :
    db = DB.DBManager()
    db.setWhere("rec_name", rec_name)

    list = db.GetList("recRaw")

    datalist = []
    for line in list :
        soup = BeautifulSoup(line["content_raw"], "html.parser")
        Target_txt = soup.select("body > div")
        for MainTXT in Target_txt :
            print(MainTXT)
recParse("SARAM_IN")
            # # |공고일자 rec_date|
            # rec_date      = MainTXT.select_one('div.careers-table.center.qr > table > tbody > tr > td:nth-child(1)').text.replace(".", "-")
            
            list_str_parse = soup.find('meta', attrs = {'name':'description'})['content'].split(",")
            tag_name = 'meta'
            attrs_key = {'name':'description'}
            attrs_value = 'content'
            
            list_str_parse = soup.find(tag_name, attrs = attrs_key)[attrs_value].split(",")
                
            # |제목 title|
            title         = MainTXT.select_one('div.careers-new > div.border > div.left > div.tit-area > p').text
            
            # |내용 content|
            content       = MainTXT.select_one('div:nth-child(4) > table > tbody').text
            
            # |신입경력 career| - 문제 발생 너무 데이터 크기가 작음
            # career        = MainTXT.select_one('div.careers-new > div.border > div.left > div:nth-child(2) > div:nth-child(1) > div > ul > li:nth-child(1)').text.strip()
            
            # # |급여구분 pay_type| - ← 이해 못함, 월급 단위? 그런 거라면 없음.
            # pay_type    = MainTXT.select_one('div:nth-child(4) > table > tbody').text

            # |급여금액 pay| - 문제 발생 급여가 범위 형식임
            # pay           = MainTXT.select_one('div.careers-new > div.border > div.left > div:nth-child(2) > div:nth-child(2) > div > ul > li:nth-child(2) > span').text.strip()

            # |모집인원 recruit_count|
            recruit_count = MainTXT.select_one('div:nth-child(5) > table > tbody > tr > td:nth-child(4)').text.strip().replace("입사지원현황통계", "")
            recruit_count = int(re.sub(r'[^0-9]', '', recruit_count))


            titdata = {
                #DB에서 읽어온 정보
                'raw_no' : line["raw_no"],
                'get_date' : line["get_date"],
                'rec_name' : line["rec_name"] ,
                'contents_URL' :line["contents_URL"],
                #"contents_raw"에서 파싱한 정보
                'comu_date':date.text,                            #게시일자
                'title' :title.text,
                'contents' :note.text,
                'view' : hit.text,
                'contents_raw' : line,
                'replys_raw' : comment
                }
            datalist.append(titdata)
        '''
        db = DB.DBManager()
        db.SetList("comuList",datalist)
        datalist=[]
        '''

# 커뮤니티 이름 지정
comuParse("OKKY")