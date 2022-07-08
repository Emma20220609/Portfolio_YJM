# from pandas import DataFrame
import requests
from bs4 import BeautifulSoup
import DBManager as DB

list = []

def worknet() :
    work_net = "https://www.work.go.kr/empInfo/empInfoSrch/list/dtlEmpSrchList.do?careerTo=&keywordJobCd=&occupation=133100%7C133101%7C133200&templateInfo=&shsyWorkSecd=&rot2WorkYn=&payGbn=&resultCnt=10&keywordJobCont=N&cert=&cloDateStdt=&moreCon=&minPay=&codeDepth2Info=11000&isChkLocCall=&sortFieldInfo=DATE&major=&resrDutyExcYn=&eodwYn=&sortField=DATE&staArea=&sortOrderBy=DESC&keyword=&termSearchGbn=&carrEssYns=&benefitSrchAndOr=O&disableEmpHopeGbn=&webIsOut=job&actServExcYn=&maxPay=&keywordStaAreaNm=N&emailApplyYn=&listCookieInfo=DTL&pageCode=&codeDepth1Info=11000&keywordEtcYn=&publDutyExcYn=&keywordJobCdSeqNo=&exJobsCd=&templateDepthNmInfo=&computerPreferential=&regDateStdt=&employGbn=&empTpGbcd=1&region=&infaYn=&resultCntInfo=10&siteClcd=all&cloDateEndt=&sortOrderByInfo=DESC&currntPageNo=19&indArea=&careerTypes=&searchOn=&tlmgYn=&subEmpHopeYn=&academicGbn=&templateDepthNoInfo=&foriegn=&mealOfferClcd=&station=&moerButtonYn=&holidayGbn=&enterPriseGbn=&academicGbnoEdu=&cloTermSearchGbn=&keywordWantedTitle=N&stationNm=&benefitGbn=&keywordFlag=&essCertChk=N&isEmptyHeader=&depth2SelCode=&_csrf=4e7cd243-f7fc-46fb-9019-1e38e74acbe3&keywordBusiNm=N&preferentialGbn=&rot3WorkYn=&pfMatterPreferential=&regDateEndt=&staAreaLineInfo1=11000&staAreaLineInfo2=1&pageIndex=1&termContractMmcnt=&careerFrom=&laborHrShortYn=#viewSPL"

    agent_head = {
            "user-agent" : "useragent.chrome",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }
    response = requests.get(work_net,headers=agent_head)
    soup = BeautifulSoup(response.text, "html.parser")
    
    pg_idx = soup.find('table', class_='board-list').find_all('tr')
    td_cont = len(pg_idx) - 1
    totalCount = soup.select_one('#mForm > div.board-list-count.mt50 > p > strong').text.replace(",", "")
    totalpage = int(totalCount) // int(td_cont) + 1
    print('-',totalpage,'-까지 수집해야 합니다.')
    

    for pageno in range(1,2) :
        work_net = "https://www.work.go.kr/empInfo/empInfoSrch/list/dtlEmpSrchList.do?careerTo=&keywordJobCd=&occupation=133100%7C133101%7C133200&templateInfo=&shsyWorkSecd=&rot2WorkYn=&payGbn=&resultCnt=10&keywordJobCont=N&cert=&cloDateStdt=&moreCon=&minPay=&codeDepth2Info=11000&isChkLocCall=&sortFieldInfo=DATE&major=&resrDutyExcYn=&eodwYn=&sortField=DATE&staArea=&sortOrderBy=DESC&keyword=&termSearchGbn=&carrEssYns=&benefitSrchAndOr=O&disableEmpHopeGbn=&webIsOut=job&actServExcYn=&maxPay=&keywordStaAreaNm=N&emailApplyYn=&listCookieInfo=DTL&pageCode=&codeDepth1Info=11000&keywordEtcYn=&publDutyExcYn=&keywordJobCdSeqNo=&exJobsCd=&templateDepthNmInfo=&computerPreferential=&regDateStdt=&employGbn=&empTpGbcd=1&region=&infaYn=&resultCntInfo=10&siteClcd=all&cloDateEndt=&sortOrderByInfo=DESC&currntPageNo=19&indArea=&careerTypes=&searchOn=&tlmgYn=&subEmpHopeYn=&academicGbn=&templateDepthNoInfo=&foriegn=&mealOfferClcd=&station=&moerButtonYn=&holidayGbn=&enterPriseGbn=&academicGbnoEdu=&cloTermSearchGbn=&keywordWantedTitle=N&stationNm=&benefitGbn=&keywordFlag=&essCertChk=N&isEmptyHeader=&depth2SelCode=&_csrf=4e7cd243-f7fc-46fb-9019-1e38e74acbe3&keywordBusiNm=N&preferentialGbn=&rot3WorkYn=&pfMatterPreferential=&regDateEndt=&staAreaLineInfo1=11000&staAreaLineInfo2=1&pageIndex=" + str(pageno) + "&termContractMmcnt=&careerFrom=&laborHrShortYn=#viewSPL"
        response = requests.get(work_net,headers=agent_head)
        soup = BeautifulSoup(response.text, "html.parser")
        
        table_data = soup.select_one("#mForm > div.table-wrap > table > tbody")
        companyList1 = table_data.select('tr')
        for company in companyList1:
            # |사이트명|
            rec_name = "WORK_NET"

            # |업체명|
            com_name = company.select_one('td:nth-child(2) > a').text
            print(com_name)

            # |모집 공고 세부 사항 주소|
            contents_URL = company.select_one('div.cp-info-in > a')['href']
            
            # |공고글 원본|
            MainText_URL = "https://www.work.go.kr" + contents_URL
            response = requests.get(MainText_URL, headers=agent_head)
            soup = BeautifulSoup(response.text, "html.parser")
            
            content_raw = soup.select_one('#contents > div > div.careers-area')
            content_raw = str(content_raw)

            #회사명, 공고 세부 주소, 등록일자
            data = {'rec_name'      :rec_name,
                    'com_name'      :com_name,
                    'contents_URL'  :MainText_URL,
                    'content_raw'   :content_raw   }
            #리스트로 작성, 계속해서 쌓이는 방식의 list
            list.append(data)

    db = DB.DBManager()
    db.SetList("recRaw",list)

worknet()


    # #데이터 프레임 넣기
    # df = DataFrame(list)
    # #csv 파일로 저장한다.
    # filename = 'D:\\2nd-Project\\2nd Project\\park\\220628\\2. 워크넷_url, 실제파일, 분석자료_0622\\1worknet.csv'
    # df.to_csv(filename, encoding="utf-8-sig", index=False)
    # return