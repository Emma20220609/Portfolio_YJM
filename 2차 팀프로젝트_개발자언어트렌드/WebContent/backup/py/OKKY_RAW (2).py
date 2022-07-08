import requests
from bs4 import BeautifulSoup
import DBManager as DB

def Okky() :
    list=[]
    for i in range(0,101) :

        url = "https://okky.kr/article/"+str(i)
        agent_head = {
            "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }

        response = requests.get(url,headers=agent_head)
        soup = BeautifulSoup(response.text, "html.parser")
        #<script> 태크를 모두 삭제한다.56
        for s in soup.select('script'):
            s.extract()
        print(soup)

        titdata = {'comu_name' : 'OKKY' ,
                   'contents_URL' :url,
                   'contents_raw' :soup}
        list.append(titdata)

    db = DB.DBManager()
    db.SetList("comuRaw",list)

Okky()