"""
작성자 : 조윤찬
작성일 : 2022년 6월 27일 오전 12시 21분
"""
from bs4 import BeautifulSoup
import DBManager as DB

def comuParse(comu_name) :

    db = DB.DBManager()
    db.setWhere("comu_name", comu_name)

    list = db.GetList("comuRaw")

    datalist = []
    for line in list :
        soup = BeautifulSoup(line["contents_raw"], "html.parser")
        #print(soup)
        contents = soup.select("div.section")
        #콘텐츠의 id 값을 설정하기 위한 변수
        nodeno = {'contents_URL' : line['contents_URL']}
        nodeno = nodeno['contents_URL'].split("node/")[1]
        #print(nodeno)
        for content in contents :
            title = content.select_one('#page-title')
            note = content.select_one('#node-' + nodeno + ' > div.content')
            date= content.select_one('#node-' + nodeno + ' > div.submitted')
            comment= content.select_one('#comments')
            date = date.text.split(",")[1].split("-")[0]
            #print(date)
            titdata = {
                #DB에서 읽어온 정보
                'raw_no' : line["raw_no"],
                'get_date' : line["get_date"],
                'comu_name' : line["comu_name"] ,
                'contents_URL' :line["contents_URL"],
                #"contents_raw"에서 파싱한 정보
                'site_URL':'https://kldp.org/',
                'comu_date':date,                         #게시일자
                'title' :title.text,
                'contents' :note.text,
                'contents_raw' : line,
                'replys_raw' : comment
                }
            datalist.append(titdata)
            #print(datalist)
        
        db = DB.DBManager()
        db.SetList("comuList",datalist)
        datalist=[]
        

# 커뮤니티 이름 지정
comuParse("KLDP")