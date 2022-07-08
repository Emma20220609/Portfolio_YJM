import csv
import pandas as pd
from pandas import DataFrame, Series
import requests
from bs4 import BeautifulSoup

class OKKYCW :

    def Okky(self) :

        url = "https://okky.kr/articles/community"
        agent_head = {
            "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }


# 148177
        file_tag = 0
        count = -1
        list = []
        for pageno in range(0, 148177, 24):
            count += 1
            url = "https://okky.kr/articles/community?offset="+str(pageno)+"&max=24&sort=id&order=desc"

            response = requests.get(url,headers=agent_head)
            soup = BeautifulSoup(response.text, "lxml")
            contents = soup.select("ul.list-group > li")

            for content in contents :
                title = content.select_one('h5')
                date = content.select_one('span.timeago')
                print(title.text)
                print(date.text)
                titdata = {'title' : title.text , 'date' :date.text}
                list.append(titdata)


            if((count+1)%100==0):
                df = DataFrame(list)
                #csv 파일로 저장한다.
                filename = 'D:\\CTEAM\\2nd Project\\MOON\\OKKY\\OKKYraw'+str(file_tag)+'.csv'
                df.to_csv(filename, encoding="utf-8-sig", index=False)
                file_tag += 1
                list=[]

        if (len(list)>0):
            df = DataFrame(list)
            filename = 'D:\\CTEAM\\2nd Project\\MOON\\OKKY\\OKKYraw'+str(file_tag)+'.csv'
            df.to_csv(filename, encoding="utf-8-sig", index=False)
            file_tag += 1




jp = OKKYCW()

jp.Okky()