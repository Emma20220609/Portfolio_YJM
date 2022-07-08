from pandas import DataFrame, Series
import pandas as pd


def ReadCsv() :
    filename = 'D:\\CTEAM\\2nd Project\\MOON\\languages.csv'
    df = pd.read_csv(filename ,encoding='utf-8-sig')
    list=(df.sum())
    print(list)
    #csv 파일로 저장한다.
    filename = 'D:\\CTEAM\\2nd Project\\MOON\\languages_total.csv'
    list.to_csv(filename, encoding="utf-8-sig", index=False)

df = ReadCsv()