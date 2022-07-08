from bs4 import BeautifulSoup
import DBManager as DB
from M_saram_gtpg1 import SARAMIN_gtpg as pg # ← 전체 페이지 갯수 읽어오기 위한 모듈
from M_saram_title2 import SARAMIN_gtttl as ttl # ← 제목을 읽어오기 위한 모듈

def recParse(rec_name) :
    # |전체 페이지 불러옴, pg.get_numb()|
    totalpage = pg.get_numb()
    print('-',totalpage,'-까지 수집해야 합니다.')

    for pageno in range(1, 2) :
        saramin = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&loc_mcd=101000%2C113000&cat_mcls=2&recruitPage="+ str(pageno) +"&recruitSort=reg_dt&recruitPageCount=10&inner_com_type=&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&searchword=&show_applied=&quick_apply=&except_read=&ai_head_hunting=&mainSearch=n"
        
        # |agent-
        for i in range(1, 11) :header 불러옴, ah.get_AH()|
        response = requests.get(saramin, headers= ah.get_AH())
        soup = BeautifulSoup(response.text, "html.parser")
        print('수집중: ',pageno)
        
            table_row1 = soup.select('#recruit_info_list > div.content > div:nth-child('+ str(i) +')')
            for table_row2 in table_row1 :
    
    
    db = DB.DBManager()
    db.setWhere("rec_name", rec_name)

    list = db.GetList("recRaw")

    datalist = []
    for line in list :
        soup = BeautifulSoup(line["details_raw"], "html.parser")

        # 사람인 본문을 soup화
        contents = soup.select("body > div")
        for content in contents :
            # |전체 제목 불러옴, ttl.get_title()|
            title = content.select_one(''+ ttl.get_title() +'')
            
            # |본문 전체 불러옴 |
            Mn_ = content.select_one('body > div').text
            date= content.select_one('span.timeago')
            print(note)
recParse()
            hit= content.select_one('div.content-identity.pull-right > div:nth-child(2) ')
            comment= content.select_one('#article > div:nth-child(5) > ul > span.timeago ')
            print(comment)
            titdata = {
                #DB에서 읽어온 정보
                'raw_no' : line["raw_no"],
                'get_date' : line["get_date"],
                'rec_name' : line["rec_name"] ,
                'contents_URL' :line["contents_URL"],
                'content' :line["content_raw"].text
                
                #"contents_raw"에서 파싱한 정보
                'comu_date':date.text,                            #게시일자
                'title' :title.text,
                'contents' :note.text,
                'view' : hit.text,
                'contents_raw' : line,
                }
            datalist.append(titdata)
        '''
        db = DB.DBManager()
        db.SetList("comuList",datalist)
        datalist=[]
        '''

# 커뮤니티 이름 지정
comuParse("OKKY")