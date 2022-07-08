import requests
from pandas import DataFrame, Series
import pandas as pd
from bs4 import BeautifulSoup
import time
import random
from multiprocessing import Pool
import DBManager as DB
import recListVO as rVO
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from selenium import webdriver
import re
import json
#import pyperclip
import getpass
import urllib.request
from urllib.parse import urlparse
import urllib.parse
import sys
import csv

#crome driver
driver = webdriver.Chrome('D:\\hanok\\team\\2ndProject\\data\\chromedriver')
driver.maximize_window()
driver.implicitly_wait(6)

#객체 생성
db = DB.DBManager()
VO = rVO.recListVO()

df =pd.read_csv('D:/hanok/team/2ndProject/data/retry.csv', encoding="euckr")

#url ='https://www.wanted.co.kr/wd/114913'

def wanted(url):
    rawdata = []
    urls = url
    print(urls+"에서 크롤링 중입니다")
    driver.get(url)
    time.sleep(5)
    
    contents = driver.find_elements_by_css_selector('.JobContent_className___ca57')
    
    for i in contents:
        data = i.text
        print(data)    
        rawdata.append(data)
    print("크롤링완료")
    return rawdata

 



list = []
count = -1   

for row, columns in df.iterrows():
    count += 1
    print("row : " + str(row) + "\n ===")
    print("columns : " + str(columns))
    print(columns['com_name'] + "의 채용 공고로 이동합니다")
    wantedlist = wanted(columns['contents_URL'])
    dic = {
        'rec_name':'wanted',
        'com_name':columns['com_name'],
        'content_raw': str(wantedlist),
        'contents_URL' : columns['contents_URL']
        }
    list.append(dic)
    
    if (count+1)%100 == 0 :
        db.SetList("recRaw",list)   
        list=[]

db.SetList("recRaw",list)   
list=[]