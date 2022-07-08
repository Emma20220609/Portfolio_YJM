from pandas import DataFrame, Series
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rc

def ReadCsv() :
    filename = 'D:\\CTEAM\\2nd Project\\joe\\SOFTotal.csv'
    df = pd.read_csv(filename ,encoding="utf-8-sig")
    #print(df)
    #print(df.info())
    #정보가 없는 특정 행 삭제 (-------)
    df = df.drop([0], axis = 0)
    df = df.drop([671], axis = 0)
    #정보가 없는 데이터 삭제
    df = df.dropna()
    df["Month"] =  pd.to_datetime(df["Month"])
    df = df.astype({'Cumulative':'int64'})
    #print(df.info())
    #해당하는 값만 찾기
    c = df['Tag'].isin(['c questions'])
    cp = df['Tag'].isin(['c++ questions'])
    java = df['Tag'].isin(['java questions'])
    python = df['Tag'].isin(['python questions'])
    vb6 = df['Tag'].isin(['vb6 questions'])
    ch = df['Tag'].isin(['c# questions'])
    js = df['Tag'].isin(['javascript questions'])
    vb = df['Tag'].isin(['vb.net questions'])
    list = [df.loc[c],df.loc[cp],df.loc[java],df.loc[python],
            df.loc[vb6],df.loc[ch],df.loc[js],df.loc[vb]]
    print(list)
    return list
    
def DrawPlot(df,title) :
    #그래프 크기 설정
    plt.figure(figsize=(20,10))
    
    #한글 설정 
    rc('font', family='Malgun Gothic')
    
    plt.plot(df[0]["Month"],df[0]["Cumulative"], label="C")
    plt.plot(df[1]["Month"],df[1]["Cumulative"], label="C++")
    plt.plot(df[2]["Month"],df[2]["Cumulative"], label="Java")
    plt.plot(df[3]["Month"],df[3]["Cumulative"], label="Python")
    plt.plot(df[4]["Month"],df[4]["Cumulative"], label="VB6")
    plt.plot(df[5]["Month"],df[5]["Cumulative"], label="C#")
    plt.plot(df[6]["Month"],df[6]["Cumulative"], label="Javascript")
    plt.plot(df[7]["Month"],df[7]["Cumulative"], label="VB.net")
    
    plt.xlabel("연도")
    plt.ylabel("검색량")
    plt.legend()
    plt.title(title)
    plt.show()    
    plt.close()
    return

df = ReadCsv()

DrawPlot(df,"StackOverFlow 개발언어별 누적 검색량")

