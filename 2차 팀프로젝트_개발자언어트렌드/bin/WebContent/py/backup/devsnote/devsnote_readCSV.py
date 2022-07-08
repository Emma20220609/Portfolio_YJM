from pandas import DataFrame, Series
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rc

def ReadCsv() :
    filename = 'D:\\CTEAM\\2nd Project\\MOON\\devsnote_raw.csv'
    df = pd.read_csv(filename ,encoding='utf-8-sig')
    count_js = 0
    count_java = 0
    count_python = 0
    count_c = 0
    count_r = 0
    count_php = 0
    count_cs = 0
    count_kotlin = 0
    count_swift = 0
    count_html_css = 0
    count_jsp = 0
    count_go = 0
    count_ts = 0
    count_ruby = 0
    count_mfc = 0
    count_oc = 0
    count_vba = 0

    list = []
    for year in df['date'] :
        if '2017' in year :
            for line in df['language']:
                #print(line)
                if 'Javascript' in line:
                    count_js += 1
                if 'Java' in line:
                    count_java += 1
                if 'Python' in line:
                    count_python += 1
                if 'C/C++' in line:
                    count_c += 1
                if 'R' in line:
                    count_r += 1
                if 'PHP' in line:
                    count_php += 1
                if 'C#' in line:
                    count_cs += 1
                if 'Kotlin' in line:
                    count_kotlin += 1
                if 'Swift' in line:
                    count_swift += 1
                if 'HTML · CSS' in line:
                    count_html_css += 1
                if 'JSP' in line:
                    count_jsp += 1
                if 'Go' in line:
                    count_go += 1
                if 'TypeScript' in line:
                    count_ts += 1
                if 'Ruby' in line:
                    count_ruby += 1
                if 'mfc' in line:
                    count_mfc += 1
                if 'Objective-C' in line:
                    count_oc += 1
                if 'Visual Basic · VBA' in line:
                    count_vba += 1

            list.append([count_js, count_java, count_python, count_c, count_r, count_php, count_cs, count_kotlin, count_swift, count_html_css,count_jsp, count_go, count_ts, count_ruby, count_mfc, count_oc, count_vba])

            print(list)
            return list

def DrawPlot(df,title) :
    #그래프 크기 설정
    plt.figure(figsize=(20,10))

    #한글 설정
    rc('font', family='Malgun Gothic')
    #print(df[0][0])

    x = ['Javascript', 'Java', 'Python', 'C/C++', 'R', 'PHP', 'C#', 'Kotlin','Swift', 'HTML', 'JSP', 'Go', 'TypeScript', 'Ruby', 'mfc', 'Objective-C','Visual Basic · VBA']
    y = [df[0][0],df[0][1],df[0][2],df[0][3],df[0][4],df[0][5],df[0][6],df[0][7],df[0][8],df[0][9],df[0][10],df[0][11],df[0][12],df[0][13],df[0][14],df[0][15],df[0][16]]

    plt.bar(x, y, color = ['#5698C6', '#A88077', '#FF9E4A', '#67BA67','#E998D1','#E16263','#AE8CCD','#A8A8A8','red', 'blue', 'orange', 'pink','green','black','grey','purple','yellow'])
    plt.title(title)
    plt.legend()
    plt.show()

    return


df = ReadCsv()

DrawPlot(df,"DEVSNOTE 언어별 언급량")