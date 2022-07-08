from bs4 import BeautifulSoup
import DBManager as DB

def comuParse(comu_name) :

    db = DB.DBManager()
    db.setWhere("comu_name", comu_name)

    list = db.GetList("comuRaw")

    datalist = []
    for line in list :
        soup = BeautifulSoup(line["contents_raw"], "html.parser")
        contents = soup.select("#article")
        for content in contents :
            title = content.select_one('div.content-body > h2.panel-title')
            note = content.select_one('article.content-text')
            date= content.select_one('span.timeago')
            hit= content.select_one('div.content-identity.pull-right > div:nth-child(2) ')
            comment= content.select('#article > div:nth-child(5) > ul')
            print(comment)
            titdata = {
                #DB에서 읽어온 정보
                'raw_no' : line["raw_no"],
                'get_date' : line["get_date"],
                'comu_name' : line["comu_name"] ,
                'contents_URL' :line["contents_URL"],
                #"contents_raw"에서 파싱한 정보
                'site_URL' : "https://okky.kr/",
                'comu_date':date.text,                            #게시일자
                'title' :title.text,
                'contents' :note.text,
                'view' : hit.text,
                'contents_raw' : line,
                'replys_raw' : comment
                }
            datalist.append(titdata)

        db = DB.DBManager()
        db.SetList("comuList",datalist)
        datalist=[]


# 커뮤니티 이름 지정
comuParse("OKKY")