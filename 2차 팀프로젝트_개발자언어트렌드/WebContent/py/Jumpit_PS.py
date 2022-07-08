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
        
        title = soup.select_one("title").text
        
        serviceInfo = soup.select_one("serviceInfo")
        if serviceInfo is not None :
            serviceInfo = serviceInfo.text
        else :
            serviceInfo = ''
        responsibility = soup.select_one("responsibility")
        if responsibility is not None :
            responsibility = responsibility.text
        else :
            responsibility = ''
        qualifications = soup.select_one("qualifications")
        if qualifications is not None :
            qualifications = qualifications.text
        else :
            qualifications = ''
        preferredRequirements   = soup.select_one("preferredRequirements")
        if preferredRequirements is not None :
            preferredRequirements = preferredRequirements.text
        else :
            preferredRequirements = ''
        welfares                = soup.select_one("welfares")
        if welfares is not None :
            welfares = welfares.text
        else :
            welfares = ''
        content = ''
        if content is not None :
            content = serviceInfo + responsibility + qualifications + preferredRequirements + welfares
        else :
            content = ''
        stacklist = []
        tackstack = soup.select("stack")
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