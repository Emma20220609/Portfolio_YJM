from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from selenium import webdriver
import time
import re
import json
import pandas as pd
#import pyperclip
import getpass
import urllib.request
import random
import requests
from urllib.parse import urlparse
import urllib.parse
import sys
from bs4 import BeautifulSoup
import csv
from pandas import DataFrame, Series
import requests
from bs4 import BeautifulSoup

"""
datas = pd.read_csv('D:\\hanok\\team\\2ndProject\\data\\wantttt.csv')
print(datas)
print(type(datas))
print("="*30)

for line in datas :
    if len(line) == 0 :
        continue
    print(line)

print("="*30)


df = DataFrame(datas)
print(df.head())
print("="*30)

print(len(datas))

print("="*30)
print(df['Field4_links'])
print("="*30)
print(df[['companyname', 'Field4_links']])
"""


driver = webdriver.Chrome('C:\\Users\\USER\\Desktop\\hanok\\python\\chromedriver')
driver.maximize_window()
driver.implicitly_wait(6)

def wanted(url) :
    urls = url
    print(urls+"에서 크롤링 중입니다")
    driver.get(url)
    time.sleep(5)
    
    contents = driver.find_elements_by_css_selector('.JobDescription_JobDescription_skill_wrapper__9EdFE')
    
    for i in contents:
       
        stacklist = i.text
        print(stacklist)
    
    list.append(stacklist)     
    print("크롤링완료")
    
  
#CSV 읽기

df =pd.read_csv('C:/Users/USER/Desktop/hanok/python/wanted.csv', encoding="utf-8-sig")
#print(df)

list=[]

for row, columns in df.iterrows():
    print("row : " + str(row) + "\n ===")
    print("columns : " + str(columns))
    print(columns['companyname'] + "의 채용 공고로 이동합니다")
    wanted(columns['Field4_links'])


#데이터 프레임 넣기
df = DataFrame(list)
#csv 파일로 저장한다.
filename = 'C:/Users/USER/Desktop/hanok/python/wantedlist.csv'
df.to_csv(filename, encoding="utf-8-sig", index=False)


"""
file = open("wanted.csv","r") 
datas = csv.reader(file)
for line in datas :
    if len(line) == 0 :
        continue
    print(line)
    item = np.array(line,dtype=np,int64)
    print(item)
    print(item.sum())
    
file.close()
  




url = 'https://www.wanted.co.kr/wd/114913'

response =urllib.request.urlopen(url)
html = response.read()

encoding = response.info().get_content_charset()
html = html.decode(encoding)

#print(html)
soup = BeautifulSoup(html,"html.parser")
stack = soup.select('div')    
for item in stack:
    
    cotent = item.getText()
    print(cotent)


   """ 