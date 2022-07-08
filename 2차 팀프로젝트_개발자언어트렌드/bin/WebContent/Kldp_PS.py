"""
작성자 : 조윤찬
작성일 : 2022년 6월 27일 오전 12시 21분
"""
from bs4 import BeautifulSoup
import DBManager as DB
import pandas as pd
from pandas import DataFrame

def comuParse(comu_name) :

# DB에서 읽어오는 방법
    db = DB.DBManager()
#    db.setWhere("comu_name", comu_name)
#    list = db.GetList("comuRaw")

# 용량이 너무 커서 파일로 저장하는 중간 단계
#    df = db.GetDF("comuRaw")
#    filename = 'D:\\CTEAM\\DataLab\\WebContent\\KLDP_RAW.csv'
#    df.to_csv(filename,encoding="utf-8-sig", index=False)
#=============================================================

# 파일에서 읽어오고, 리스트로 변환
    filename = 'D:\\CTEAM\\DataLab\\WebContent\\KLDP_RAW.csv'
    df = pd.read_csv(filename ,encoding="utf-8-sig")
# df를 저장할 리스트   
    list_from_df = []
# df를 리스트로 변환
    for row, columns in df.iterrows():
        line = df.iloc[row]
        tmp  = line.to_dict()
        list_from_df.append(tmp)

    datalist = []
#    for line in list :
    for line in list_from_df :
        soup = BeautifulSoup(line["contents_raw"], "html.parser")
        #print(soup)
        contents = soup.select("div.section")
        #콘텐츠의 id 값을 설정하기 위한 변수
        nodeno = {'contents_URL' : line['contents_URL']}
        nodeno = nodeno['contents_URL'].split("node/")[1]
        #print(nodeno)
        for content in contents :
            title   = content.select_one('#page-title')
            note    = content.select_one('#node-' + nodeno + ' > div.content')
            date    = content.select_one('#node-' + nodeno + ' > div.submitted')
            comment = content.select_one('#comments')
            if date is not None :
                date = date.text.split(",")[1].split("-")[0]
            else :
                date = ""
            if title is not None :
                title = title.text
            else :
                title = ""

            if note is not None :
                note = note.text
            else :
                note = ""
            
            #print(date)
            titdata = {
                #DB에서 읽어온 정보
                'raw_no'        : line["raw_no"],
                'get_date'      : line["get_date"],
                'comu_name'     : line["comu_name"] ,
                'contents_URL'  : line["contents_URL"],
                #"contents_raw"에서 파싱한 정보
                'site_URL'      :'https://kldp.org/',
                'comu_date'     : date,                         #게시일자
                'title'         : title,
                'contents'      : note,
                'contents_raw'  : line,
                'replys_raw'    : comment
                }
            datalist.append(titdata)
            print(datalist)
        print("="*100)
        print(" setList to " + "comuList")
        db.SetList("comuList",datalist)
        datalist=[]
        

# 커뮤니티 이름 지정
comuParse("KLDP")