import requests
import json
from pandas import DataFrame, Series
import csv
import pandas as pd
import MySQLdb
import DBManager as DB

datas = pd.read_csv('D:\\CTEAM\\2nd Project\\MOON\\Github\\github.csv')
#print(datas)
list=[]
def send_api(path, method):
    API_HOST = "https://api.github.com/repos/"
    url = API_HOST + path
    headers = {'Content-Type': 'application/json', 'charset': 'UTF-8', 'Accept': 'application/vnd.github.v3+json', 'Authorization': "token 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"}
    body = { }

    try:
        if method == 'GET':
            response = requests.get(url, headers=headers)
        elif method == 'POST':
            response = requests.post(url, headers=headers, data=json.dumps(body, ensure_ascii=False, indent="\t"))
        #print("response status %r" % response.status_code)
        #print(response.text)
        data = json.loads(response.text)
        datalist = {'title' : path }
        #for lang in data :
            #list=[]
            #lang = lang.split(',')
            #print(lang)
            #list.append(lang)
            #print(list)
            #datalist = {'title' : path }
        list.append(datalist)
        #print(data)

        db = DB.DBManager()

        for columns in list:
            dic = {'contents_URL':columns['title']}
            list.append(dic)
            db.SetList("community",list)

    except Exception as ex:
        print(ex)



for i in range(0,100) :
    for j in datas.loc[i] :
        fullname = j+"/languages"
        #print(fullname)
        send_api(fullname, "GET")