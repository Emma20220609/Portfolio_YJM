from naverApi import NaverDataLabOpenAPI
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import plotly.express as px
import seaborn as sns
from fbprophet.plot import plot_plotly, plot_components_plotly
import urllib.request
import datetime
import json
import glob
import sys
import os

from fbprophet import Prophet

import warnings
warnings.filterwarnings(action='ignore')

#%matplotlib inline
plt.rcParams['axes.unicode_minus'] = False
plt.rcParams['font.family'] = 'Malgun Gothic'
plt.rcParams['axes.grid'] = False

pd.set_option('display.max_columns', 250)
pd.set_option('display.max_rows', 250)
pd.set_option('display.width', 100)

pd.options.display.float_format = '{:.2f}'.format


keyword_group_set = {
    'keyword_group_1': {'groupName': "파이썬", 'keywords': ["파이썬","python","PHTHON"]},
    'keyword_group_2': {'groupName': "자바", 'keywords': ["자바","java","JAVA"]},
    'keyword_group_3': {'groupName': "자바스크립트", 'keywords': ["자바스크립트","javascript","JAVASCRIPT"]},
    'keyword_group_4': {'groupName': "c++", 'keywords': ["씨쁠쁠","c++","C++"]}
    
}


# API 인증 정보 설정
client_id = "vYEPqdCj2_a0qhKYwSD1"
client_secret = "wFi2BJbGgT"

# 요청 파라미터 설정
startDate = "2016-01-01"
endDate = "2022-06-13"
timeUnit = 'date'
device = ''
ages = []
gender = ''

# 데이터 프레임 정의
naver = NaverDataLabOpenAPI(client_id=client_id, client_secret=client_secret)

naver.add_keyword_groups(keyword_group_set['keyword_group_1'])
naver.add_keyword_groups(keyword_group_set['keyword_group_2'])
naver.add_keyword_groups(keyword_group_set['keyword_group_3'])
naver.add_keyword_groups(keyword_group_set['keyword_group_4'])


df = naver.get_data(startDate, endDate, timeUnit, device, ages, gender)

df.head()
df.tail()

fig_1 = naver.plot_daily_trend()
fig_2 = naver.plot_monthly_trend()
fig_3 = naver.plot_pred_trend(days=30)

def __init__(self, client_id, client_secret):
       
        self.client_id = client_id
        self.client_secret = client_secret
        self.keywordGroups = []
        self.url = "https://openapi.naver.com/v1/datalab/search"

        
# Request body
        body = json.dumps({
            "startDate": startDate,
            "endDate": endDate,
            "timeUnit": timeUnit,
            "keywordGroups": self.keywordGroups,
            "device": device,
            "ages": ages,
            "gender": gender
        }, ensure_ascii=False)
 # Results
        request = urllib.request.Request(self.url)
        request.add_header("X-Naver-Client-Id",self.client_id)
        request.add_header("X-Naver-Client-Secret",self.client_secret)
        request.add_header("Content-Type","application/json")
        response = urllib.request.urlopen(request, data=body.encode("utf-8"))
        rescode = response.getcode()
        if(rescode==200):
            # Json Result
            result = json.loads(response.read())
            
            df = pd.DataFrame(result['results'][0]['data'])[['period']]
            for i in range(len(self.keywordGroups)):
                tmp = pd.DataFrame(result['results'][i]['data'])
                tmp = tmp.rename(columns={'ratio': result['results'][i]['title']})
                df = pd.merge(df, tmp, how='left', on=['period'])
            self.df = df.rename(columns={'period': '날짜'})
            self.df['날짜'] = pd.to_datetime(self.df['날짜'])
            
        else:
            print("Error Code:" + rescode)
            
        return self.df



colList = df.columns[1:]
n_col = len(colList)
       
fig_list = []
for i in range(n_col):
        
    globals()[f"df_{str(i)}"] = df[['날짜', f'{colList[i]}']]
    globals()[f"df_{str(i)}"] = globals()[f"df_{str(i)}"].rename(columns={'날짜': 'ds', f'{colList[i]}': 'y'})
    
    m = Prophet()
    m.daily_seasonality=True
    m.weekly_seasonality=True
    m.fit(globals()[f"df_{str(i)}"])
    
    future = m.make_future_dataframe(periods=365)
     
    
    forecast = m.predict(future)
    forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].tail()
    
    globals()[f"fig_{str(i)}"] = m.plot(forecast, figsize=(12,6))
    plt.title(colList[i], size=20, weight='bold')
    
    fig_list.append(globals()[f"fig_{str(i)}"])


    fig= m.plot(globals())
 #   return fig_list
