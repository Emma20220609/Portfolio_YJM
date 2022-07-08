import requests
from pandas import DataFrame, Series
import pandas as pd
from bs4 import BeautifulSoup
import time
import random
from multiprocessing import Pool
import DBManager as DB



def kldp() :
    agent_head = {
        "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36",
        "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
    }
    
    list = [] 
    #https://kldp.org/node/165600
    
    for pageno in range(1,165601):
        
        url = "https://kldp.org/node/" + str(pageno)
        
        response = requests.get(url,headers=agent_head)

        soup = BeautifulSoup(response.text, "lxml")

        #script 태그를 모두 삭제한다.56
        for s in soup.select('script'):
            s.extract()
        #style 태그를 모두 삭제한다.56
        for s in soup.select('style'):
            s.extract()

        soup = soup.select('#content > div')
            
        soup = str(soup)
        
        #print(soup)

        datas = { "comu_name" : "kldp", "contents_URL" : url, "contents_raw" : soup }
        
        list.append(datas)

        db = DB.DBManager()
        db.SetList("comuRaw",list)
        list=[]


if __name__=='__main__':
    
    pool = Pool(processes=8) # 4개의 프로세스를 사용합니다.
    pool.map(kldp()) # get_contetn 함수를 넣어줍시다.
    

