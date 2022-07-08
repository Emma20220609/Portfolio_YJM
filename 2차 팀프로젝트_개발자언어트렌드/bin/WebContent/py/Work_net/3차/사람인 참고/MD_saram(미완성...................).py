import requests
from bs4 import BeautifulSoup
from M_saram_gtpg1 import SARAMIN_gtpg as pg # ← 전체 페이지 갯수 읽어오기 위한 모듈, ('파일', '클래스', 별칭, '함수')

list=[]

tatalCount = 0

class SARAMIN_MODULE :
    def get_pg() :
        pagecount = 10
        
        saramin = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&loc_mcd=101000%2C113000&cat_mcls=2&recruitPage=1&recruitSort=reg_dt&recruitPageCount=10&inner_com_type=&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&searchword=&show_applied=&quick_apply=&except_read=&ai_head_hunting=&mainSearch=n"
        agent_head = {
                "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
                "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }
    
        response = requests.get(saramin,headers=agent_head)
        soup = BeautifulSoup(response.text, "html.parser")
        
        # |숫자 카운팅의 불필요한 한글 제거|
        totalCount = soup.select_one('#recruit_info > div.header > span').text
        totalCount = totalCount.replace(" ", "").replace(",", "").replace("총", "").replace("건", "")
        
        # |전체 페이지 계산|
        totalpage = (int(totalCount) // pagecount) + 1
        return totalpage
        
    
    # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 여기서 멈췄음....
    def saramin() :
        print('-',totalpage,'-까지 수집해야 합니다.')
    
        for pageno in range(1, totalpage) :
            saramin = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&loc_mcd=101000%2C113000&cat_mcls=2&recruitPage="+ str(pageno) +"&recruitSort=reg_dt&recruitPageCount=10&inner_com_type=&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&searchword=&show_applied=&quick_apply=&except_read=&ai_head_hunting=&mainSearch=n"
            
            agent_head = {
                    "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
                    "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
            }
            response = requests.get(saramin, headers=agent_head)
            soup = BeautifulSoup(response.text, "html.parser")


# '본문 내용'을 가져오기 위한 파일
class SARAMIN_gtMT:
    def rd_MT(site) :
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