import csv
import pandas as pd
from pandas import DataFrame, Series
import requests
from bs4 import BeautifulSoup

class JUMPITCW :
    
    def Jumpit(self) :
    
        url = "https://api.jumpit.co.kr/api/positions?page=1"
        agent_head = {
            "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }
    
        response = requests.get(url,headers=agent_head)
    
        soup = BeautifulSoup(response.text, "lxml")
    
        posi_navi = soup.select('positions')
    
        #전체 공고갯수
        totalCount = soup.select_one('totalCount').text
        #print(totalCount)
    
        #positions 의 개수 감싸는 포지션 1 제거
        posi_navi_conut = len(posi_navi) - 1
        #print(posi_navi_conut)
    
        #토탈페이지개수
        totalpage = int(totalCount) // int(posi_navi_conut) + 2
        #print(totalpage)
    
        list = []
    
        #companyList 안에 있는 모든 company에서
        
        for pageno in range(1,totalpage):
            url = "https://api.jumpit.co.kr/api/positions?page=" + str(pageno)
    
            response = requests.get(url,headers=agent_head)
    
            soup = BeautifulSoup(response.text, "lxml")
    
            #company는 하나의 positions 태그 안에 들어있다
            #print(companyList)
            #print(url)
            companyList = soup.select('SucResponse > result > positions > positions')
            for company in companyList:
                #print(company)
                #company 이름을 읽어오고
                companyName = company.select_one('companyName')
                #같은 company 에서 다른 title로 올라온 경우 구분하기 위해 title을 읽어온다
                title = company.select_one('title')
                #print('현재페이지번호' + str(pageno))
                #print("="*50)
                #print("companyName : " + companyName.text)
                #print("title : " + title.text)
                #print("-"*50)
                #print(titdata)
                #print(list)
                #하나의 공고에 들어있는 모든 techStacks 리스트에서 각각의 techStack 를 읽어온다
                stackList = []
                for techStacks in company.select('techStacks'):
                    for techStack in techStacks.select('techStacks'):
                        stackList.append(techStack.text)
                #print("-"*50)
                titdata = {'company' : companyName.text , 'title' : title.text, 'stacklist' : stackList}
                print(titdata)
                list.append(titdata)
        
        df = DataFrame(list)
        #csv 파일로 저장한다.
        filename = 'D:\\CTEAM\\2nd Project\\joe\\jumpit.csv'
        df.to_csv(filename, encoding="utf-8-sig", index=False)
        return
        

jp = JUMPITCW()

jp.Jumpit()