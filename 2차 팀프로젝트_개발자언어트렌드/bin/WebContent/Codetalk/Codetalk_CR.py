import csv
import pandas as pd
from pandas import DataFrame, Series
import requests
from bs4 import BeautifulSoup
import json
import urllib.request as req
#import DBManager as DB

def codentalks() :
    
    list = []
    
    for pageno in range(0,1) :
        res = requests.get("https://www.codentalks.com/latest.json?no_definitions=true&order=default&page=" + str(pageno))
        data = res.json()
        print(data['topic_list']['topics'])
        
        for item in data['topic_list']['topics']:
            tp_data = (item['title'],item['created_at'])      
            #print(tp_data)
            data = {'title' : item['title'] , 'date' : item['created_at'] }
            list.append(data)
        print(list)
    
    
codentalks()