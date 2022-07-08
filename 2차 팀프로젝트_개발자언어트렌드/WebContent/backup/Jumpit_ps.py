"""
작성자 : 조윤찬
작성일 : 2022년 6월 28일 오후 3시 21분
"""
from bs4 import BeautifulSoup
import DBManager as DB
import pandas as pd
from pandas import DataFrame

def recParse(rec_name) :

# DB에서 읽어오는 방법
    db = DB.DBManager()
    db.setWhere("rec_name", rec_name)
    list = db.GetList("recRaw")

    for line in list :
        soup = BeautifulSoup(line["content_raw"], "lxml")
        #print(soup)
        title = soup.select_one("title").text
        #print(title)
        serviceInfo = soup.select_one("serviceInfo").text
        #print("="*100)
        #print(serviceInfo)
        #print("="*100)
        responsibility = soup.select_one("responsibility").text
        #print("="*100)
        #print(responsibility)
        #print("="*100)
        qualifications = soup.select_one("qualifications").text
        #print("="*100)
        #print(qualifications)
        #print("="*100)
        preferredRequirements   = soup.select_one("preferredRequirements").text
        #print("="*100)
        #print(preferredRequirements)
        #print("="*100)
        welfares                = soup.select_one("welfares").text
        #print("="*100)
        #print(welfares)
        #print("="*100)
        content = serviceInfo + responsibility + qualifications + preferredRequirements + welfares
        #print(content)
        stacklist = []
        tackstack = soup.select("stack")
        #print(tackstack)
        titdata = {
            #DB에서 읽어온 정보
            'raw_no'        : line["raw_no"],
            'get_date'      : line["get_date"],
            'rec_name'      : line["rec_name"] ,
            'com_name'      : line["com_name"] ,
            'contents_URL'  : line["contents_URL"],
            #"contents_raw"에서 파싱한 정보
            'title'         : title,
            'content'      : content,
            'details_raw'  : tackstack,
            }
        
        list.append(titdata)
        #print(list)
        print("="*100)
        print(" setList to " + "recList")
        db.SetList("recList",list)
        list=[]

# 커뮤니티 이름 지정
recParse("jumpit")