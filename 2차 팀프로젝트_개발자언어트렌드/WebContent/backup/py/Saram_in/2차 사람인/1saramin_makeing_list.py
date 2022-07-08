import requests
from bs4 import BeautifulSoup
from pandas import DataFrame
from datetime import datetime
from saramin_get_info2 import saramin as S# ←클래스와 함수 부르기 위한 import
from add_techStack_column4_2 import ReadStack as Rdstk # ←클래스와 함수 부르기 위한 import

list = []
now = datetime.now()

def saramin() :
    inf_Sno1 = ""
    inf_Sno2 = ""
    
    get_date = ""
    rec_date = ""
    rec_name = ""
    contents_URL = ""
    com_URL = ""
    content_ori = ""
    career = ""
    
    pay1 = ""
    pay2 = ""
    
    stack_1 = ""
    stack_2 = ""
    stack_3 = ""
    stack_4 = ""
    stack_5 = ""
    stack_6 = ""
    stack_7 = ""
    stack_etc = []
    
    pagecount = 10
    
    saramin = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&loc_mcd=101000%2C113000&cat_mcls=2&recruitPage=1&recruitSort=reg_dt&recruitPageCount=10&inner_com_type=&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&searchword=&show_applied=&quick_apply=&except_read=&ai_head_hunting=&mainSearch=n"
    agent_head = {
            "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36",
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
        print('수집중: ',pageno)

        for i in range(1, 11) :
            table_row1 = soup.select('#recruit_info_list > div.content > div:nth-child('+str(i)+')')
            for table_row2 in table_row1 :                # ========================================================
                # |일련번호|
                inf_Sno1 = t_row2.select_one('div.area_job > h2 > a')['href']
                inf_Sno2 = inf_Sno1[50:58]
                
                # (제목 - ReadStack 용도)
                title = t_row2.select('div.area_corp > strong > a')
                
                # |수집일자|
                get_date = now.date()
                
                # |공고일자|
                rec_date = t_row2.select_one('div.area_job > div.job_date > span').text
                
                # |사이트명|
                rec_name = "사람인"
                
                # |주소| ======================(모집공고 추출 용도)======================
                contents_URL = 'https://www.saramin.co.kr/zf_user/jobs/relay/view-detail?rec_idx=' + inf_Sno2
                
                # |업체명|
                com_URL = t_row2.select_one('div.area_corp > strong > a').text.strip()
                
                # |업체 사이트|(불가)

                # |내용| = 모집공고
                try :
                    content_ori = S.rd_inf(contents_URL)
                    if content_ori != None :
                        print(com_URL)
                    else :
                        print('모집공고가 없습니다')
                except Exception as e:
                    print('모집 공고 Error')
                
                # |경력|
                career = t_row2.select_one('div.area_job > div.job_condition > span:nth-child(2)').text

                # |급여|
                try :
                    pay1 = t_row2.select_one('div.area_job > div.job_condition > span:nth-child(5)').text
                    pay2 = pay1
                    pay1 = ""
                    
                except Exception as e:
                    print('pay None')
                    
                # |인원|(불가)
                # ========================================================
                
                # stack_1
                # stack_2
                # stack_3
                # stack_4
                # stack_5
                # stack_6
                # stack_7
                # stack_etc
                stack_etc = Rdstk.ReadCsv(title, content_ori)
                
                data = {
                    'inf_Sno': inf_Sno2,
                    'get_date': get_date,
                    'rec_date': rec_date,
                    'rec_name': rec_name,
                    'contents_URL': contents_URL,
                    'com_URL': com_URL,
                    'content_ori': content_ori,
                    'career': career,
                    'pay': pay2,
                    'stack_etc': stack_etc
                }
                
                list.append(data)
                
    #데이터 프레임 넣기
    df = DataFrame(list)
    #csv 파일로 저장한다.
    filename = 'D:\\CTEAM\\1saramin_site.csv'
    df.to_csv(filename, encoding="utf-8-sig", index=False)
    print('\n★D:\\CTEAM\\1saramin_site에 저장을 완료했습니다.★')
    return
saramin()

# df = pd.read_csv("D:\\CTEAM\\saramin2.csv", encoding="utf-8-sig")
# for row, columns in df.iterrows():
#     saramin(columns['info_url'], str(row))

#recruit_info_list > div.content > div:nth-child(1)