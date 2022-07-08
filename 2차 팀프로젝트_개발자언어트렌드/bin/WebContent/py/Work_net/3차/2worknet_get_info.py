import re # 정규식 위한 라이브러리 re
import requests
import pandas as pd
from bs4 import BeautifulSoup
from pandas import DataFrame
from add_techStack_column4_2 import ReadStack as Rdstk # ←클래스와 함수 부르기 위한 import
import DBManager as DB

class go_MT :
    def worknet(url, row) :
        url = "https://www.work.go.kr" + url
        agent_head = {
                "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
                "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
            }
    
        response = requests.get(url,headers=agent_head)
        soup = BeautifulSoup(response.text, "html.parser")

        info = soup.select_one('#contents > div > div.careers-area')
        if info != None :
            company = soup.select_one('div.careers-new > div.border > div.right > div.info > ul > li:nth-child(1) > div').text
            title = soup.select_one('div.careers-new > div.border > div.left > div.tit-area > p')
            c_info = soup.select_one('div:nth-child(4) > table > tbody > tr > td').text
            rcut_acnt = soup.select_one('div:nth-child(5) > table > tbody > tr > td:nth-child(4)').text
            # ↓ 정규식으로 모집인원의 숫자만 뽑아냄
            rcut_acnt = re.sub("[^0-9]", "", rcut_acnt)
            # TechStack 출력 위한, import 클래스 사용.
            TechStack = Rdstk.ReadCsv(title, c_info)
            
            #1.회사명, 2.제목, 3.모집 공고, 4.모집 인원
            data = {
            'com_name':company.strip(),
            'contents_URL':title.text.strip(),
            'content_ori':c_info.strip(),
            'count':rcut_acnt,
            'stack_etc': TechStack
            }
            
            #리스트로 작성
            list.append(data)
        else :
            return
            # print("no data from -"+ url + "-")
    
    # #CSV 읽기
    # df = pd.read_csv("D:\\CTEAM\\1worknet.csv", encoding="utf-8-sig")
    #print(df);
    #print("=======================================================")
    list=[]
    
    for row, columns in df.iterrows():
        print("row : " + str(row) + "\n ===")
        print("columns : " + str(columns))
        # print(columns['info_url'] + "의 채용 공고로 이동합니다")
        worknet(columns['info_url'], str(row))
    
    
    # db = DB.DBManager()
    # db.SetList("recList",list)


#데이터 프레임으로 만들어넣기
df = DataFrame(list)
# print(df)

#csv 파일로 저장한다.
filename = 'D:\\CTEAM\\2worknet_info.csv'
df.to_csv(filename, encoding="utf-8-sig", index=False)
print('\n★D:\\CTEAM\\2worknet_info2에 저장을 완료했습니다.★')
