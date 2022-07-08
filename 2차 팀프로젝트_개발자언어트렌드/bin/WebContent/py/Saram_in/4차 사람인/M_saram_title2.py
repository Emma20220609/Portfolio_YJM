# '제목' 추출 모듈
import requests
from bs4 import BeautifulSoup

list = []

def saramin() :
    pagecount = 10
    
    saramin = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&loc_mcd=101000%2C113000&cat_mcls=2&recruitPage=1&recruitSort=reg_dt&recruitPageCount=10&inner_com_type=&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&searchword=&show_applied=&quick_apply=&except_read=&ai_head_hunting=&mainSearch=n"
    agent_head = {
            "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }
    response = requests.get(saramin,headers=agent_head)
    soup = BeautifulSoup(response.text, "html.parser")

    # |숫자 카운팅의 불필요한 한글 제거|
    totalCount = soup.select_one('#recruit_info > div.header > span').text.replace(" ", "").replace(",", "").replace("총", "").replace("건", "")

    # |전체 페이지 계산|
    totalpage = (int(totalCount) // pagecount) + 1
    print('-',totalpage,'-까지 수집해야 합니다.')


    for pageno in range(1, totalpage) :
        saramin = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&loc_mcd=101000%2C113000&cat_mcls=2&recruitPage="+ str(pageno) +"&recruitSort=reg_dt&recruitPageCount=10&inner_com_type=&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&searchword=&show_applied=&quick_apply=&except_read=&ai_head_hunting=&mainSearch=n"

        response = requests.get(saramin,headers=agent_head)
        soup = BeautifulSoup(response.text, "html.parser")
        print('수집중: ',pageno)

        for i in range(1, 11) :
            table_row1 = soup.select('#recruit_info_list > div.content > div:nth-child('+str(i)+')')
            for table_row2 in table_row1 :                # ========================================================
                # (제목 - ReadStack 용도)
                title = table_row2.select('div.area_corp > strong > a')
                return title
