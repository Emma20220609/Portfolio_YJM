import csv
import pandas as pd
from pandas import DataFrame, Series
import requests
from bs4 import BeautifulSoup
import MySQLdb
import DBManager as DB


class DEVSNOTECW :

    def Devsnote(self) :

        url = "https://devsnote.com/g/language"
        agent_head = {
            "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }

        list = []

        for pageno in range(1,15):
            url = "https://devsnote.com/g/language?&page_no="+str(pageno)+"&per_page=24&total=323"
            response = requests.get(url,headers=agent_head)

            soup = BeautifulSoup(response.text, "lxml")

            contents = soup.select("div.list-post > div")



            for content in contents :
                title = content.select_one('a')
                language = content.select_one('a.cate-label')
                date = content.select_one('span.post-from-timeago')
                #print(title.text)
                #print(language.text)
                #print(date.text)
                date1 = date.text.replace("에","")
                titdata = {'title' : title.text ,'language':language.text, 'date' :date1}
                list.append(titdata)

                db = DB.DBManager()

            for columns in list:
                dic = {'contents_URL':columns['title'],'comu_name': 'devsnote','comu_date':columns['date'],'word_list':columns['language']}
                list.append(dic)
                db.SetList("community",list)

jp = DEVSNOTECW()

jp.Devsnote()