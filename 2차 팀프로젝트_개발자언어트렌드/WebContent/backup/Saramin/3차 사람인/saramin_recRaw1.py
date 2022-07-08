import requests
from bs4 import BeautifulSoup
import DBManager as DB

list=[]

def saramin() :
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
    print('-',totalpage,'-까지 수집해야 합니다.')

    for pageno in range(1, totalpage) :
        saramin = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&loc_mcd=101000%2C113000&cat_mcls=2&recruitPage="+ str(pageno) +"&recruitSort=reg_dt&recruitPageCount=10&inner_com_type=&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&searchword=&show_applied=&quick_apply=&except_read=&ai_head_hunting=&mainSearch=n"

        response = requests.get(saramin,headers=agent_head)
        soup = BeautifulSoup(response.text, "html.parser")
        
        #<script> 태그를 모두 삭제한다.56
        for s in soup.select('script'):
            s.extract()
        print('수집중: ',pageno)

# ========================= ↓수집 내용↓ =================================
        # 1. 사이트명
        rec_name = "SARAM_IN"
        
        # 2. 업체명
        com_name = soup.select_one('div.area_corp > strong > a').text
        
        # 3. 공고글주소[URL]
        contents_URL = saramin
        
        # 4. 공고글원본[tag]
        content_raw = str(soup)
        
        titdata = {'rec_name'     : rec_name,
                   'com_name'     : com_name,
                   'contents_URL' : contents_URL,
                   'content_raw'  : content_raw   }
        list.append(titdata)

    db = DB.DBManager()
    db.SetList("recRaw",list)

saramin()

