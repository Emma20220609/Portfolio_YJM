# 본문 내용, Info를 가져오기 위한 파일

import requests
from bs4 import BeautifulSoup
# import DBManager as DB
# from add_techStack_column4_2 import ReadStack as Rdstk # ←클래스와 함수 부르기 위한 import


class SARAMIN_gtif:
    def rd_inf(site) :
        url = site
        # print(url+"에서 크롤링 중입니다")
        agent_head = {
                "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36"
            }
        response = requests.get(url,headers=agent_head)
        soup = BeautifulSoup(response.text, "html.parser")
    
        if soup != None :
            info_ifm = soup.select('body > div')
            return info_ifm
        else :
            print("모집공고 없음 saramin_get_info2")

# line 20에 select_one('body > div').text에서 soup 추출하는 방식으로 변경