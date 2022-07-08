import requests
from bs4 import BeautifulSoup
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rc
from sklearn.linear_model import LinearRegression
import datetime as dt
import statsmodels.api as sm
import statsmodels.formula.api as smf
from pandas import DataFrame, Series


url  = "https://github.com/siyuan-note/siyuan"
#url  = "https://api.github.com/repositories"



list = []
response = requests.get(url)
soup = BeautifulSoup(response.text, "lxml")
content = soup.select("ul.list-style-none>li.d-inline>a>span")
for i in content :
    i = i.text
    list.append(i)
    print(i)
"""
df = DataFrame(list)
 #csv 파일로 저장한다.
filename = 'D:\\CTEAM\\2nd Project\\moon\\github.csv'
df.to_csv(filename, encoding="utf-8-sig", index=False)
"""