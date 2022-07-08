from pandas import DataFrame, Series
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rc

def ReadCSV() :

    for i in range(0,61):
        list=[]
        filename = 'D:\\CTEAM\\2nd Project\\MOON\\OKKY\\OKKYraw'+str(i)+'.csv'
        df = pd.read_csv(filename ,encoding="utf-8-sig")
        data=df[(df.title.str.contains('파이썬','Python'))]
        print(data)
        """
        list.append(data)
        df = DataFrame(list)
        #csv 파일로 저장한다.
        filename = 'D:\\CTEAM\\2nd Project\\MOON\\OKKY_java.csv'
        df.to_csv(filename,encoding="utf-8-sig", index=False)
"""
        """
    count_c = 0
    count_cs = 0
    count_cpp = 0
    count_java = 0
    count_js = 0
    count_Python = 0
    count_vb6 = 0
    count_vb = 0
    count_swift =0
    count_kotlin = 0

    list = []

    for line in df['title']:

        #C언어
        if 'C언어' in line:
            count_c += 1
        elif 'c언어' in line:
            count_c += 1

        if 'C#' in line:
            count_cs += 1
        elif 'c#' in line:
            count_cs += 1

        if 'C++' in line:
            count_cpp += 1
        elif 'c++' in line:
            count_cpp += 1

        #자바
        if 'Java' in line:
            count_java += 1
        elif 'java' in line:
            count_java += 1
        elif '자바' in line:
            count_java += 1

        #자바스크립트
        if 'JavaScript' in line:
            count_js += 1
        elif 'javaScript' in line:
            count_js += 1
        elif 'JS' in line:
            count_js += 1
        elif 'js' in line:
            count_js += 1
        elif '자바스크립트' in line:
            count_js += 1

        #파이썬
        if 'Python' in line:
            count_Python += 1
        elif 'python' in line:
            count_Python += 1
        elif '파이썬' in line:
            count_Python += 1

        #VB
        if 'Vb6' in line:
            count_vb6 += 1

        if  'Vb.net' in line:
            count_vb += 1
        #swift
        if 'Swift' in line:
            count_swift += 1
        elif 'swift' in line:
            count_swift += 1

        #kotlin
        if 'Kotlin' in line:
            count_kotlin += 1
        elif 'kotlin' in line:
            count_kotlin += 1
        elif '코틀린' in line:
            count_kotlin += 1
    print(list)
    return list

def DrawPlot(df,title) :
    #그래프 크기 설정
    plt.figure(figsize=(20,10))

    #한글 설정
    rc('font', family='Malgun Gothic')
    #print(df[0][0])

    x = ['C', 'C#', 'C++', 'Java', 'JavaScript', 'Python', 'Vb6', 'Vb.net', 'Swift','Kotlin']
    y = [df[0][0],df[0][1],df[0][2],df[0][3],df[0][4],df[0][5],df[0][6],df[0][7],df[0][8],df[0][9]]

    plt.bar(x, y, color = ['#5698C6', '#A88077', '#FF9E4A', '#67BA67','#E998D1','#E16263','#AE8CCD','#A8A8A8','red','blue'])
    plt.title(title)
    plt.legend()
    plt.show()

    return
"""
df = ReadCSV()

#DrawPlot(df,"OKKY 언어별 언급량")