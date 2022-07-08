import requests
from bs4 import BeautifulSoup
from pandas import DataFrame


def worknet() :
    work_net = "https://www.work.go.kr/empInfo/empInfoSrch/list/dtlEmpSrchList.do?careerTo=&keywordJobCd=&occupation=133100%7C133101%7C133200&templateInfo=&shsyWorkSecd=&rot2WorkYn=&payGbn=&resultCnt=10&keywordJobCont=N&cert=&cloDateStdt=&moreCon=&minPay=&codeDepth2Info=11000&isChkLocCall=&sortFieldInfo=DATE&major=&resrDutyExcYn=&eodwYn=&sortField=DATE&staArea=&sortOrderBy=DESC&keyword=&termSearchGbn=&carrEssYns=&benefitSrchAndOr=O&disableEmpHopeGbn=&webIsOut=job&actServExcYn=&maxPay=&keywordStaAreaNm=N&emailApplyYn=&listCookieInfo=DTL&pageCode=&codeDepth1Info=11000&keywordEtcYn=&publDutyExcYn=&keywordJobCdSeqNo=&exJobsCd=&templateDepthNmInfo=&computerPreferential=&regDateStdt=&employGbn=&empTpGbcd=1&region=&infaYn=&resultCntInfo=10&siteClcd=all&cloDateEndt=&sortOrderByInfo=DESC&currntPageNo=19&indArea=&careerTypes=&searchOn=&tlmgYn=&subEmpHopeYn=&academicGbn=&templateDepthNoInfo=&foriegn=&mealOfferClcd=&station=&moerButtonYn=&holidayGbn=&enterPriseGbn=&academicGbnoEdu=&cloTermSearchGbn=&keywordWantedTitle=N&stationNm=&benefitGbn=&keywordFlag=&essCertChk=N&isEmptyHeader=&depth2SelCode=&_csrf=4e7cd243-f7fc-46fb-9019-1e38e74acbe3&keywordBusiNm=N&preferentialGbn=&rot3WorkYn=&pfMatterPreferential=&regDateEndt=&staAreaLineInfo1=11000&staAreaLineInfo2=1&pageIndex=1&termContractMmcnt=&careerFrom=&laborHrShortYn=#viewSPL"

    agent_head = {
            "user-agent" : "useragent.chrome",
            "accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }
    response = requests.get(work_net,headers=agent_head)
    soup = BeautifulSoup(response.text, "html.parser")
    # print(soup)
    
    response = requests.get(work_net,headers=agent_head)
    soup = BeautifulSoup(response.text, "html.parser")
    print(soup)
    pg_idx = soup.find('table', class_='board-list').find_all('tr')
    td_cont = len(pg_idx) - 1
    totalCount = soup.select_one('#mForm > div.board-list-count.mt50 > p > strong').text
    totalCount = totalCount.replace(",", "")
    totalpage = int(totalCount) // int(td_cont) + 1
    list = []

    for pageno in range(1,totalpage) :
        work_net = "https://www.work.go.kr/empInfo/empInfoSrch/list/dtlEmpSrchList.do?careerTo=&keywordJobCd=&occupation=133100%7C133101%7C133200&templateInfo=&shsyWorkSecd=&rot2WorkYn=&payGbn=&resultCnt=10&keywordJobCont=N&cert=&cloDateStdt=&moreCon=&minPay=&codeDepth2Info=11000&isChkLocCall=&sortFieldInfo=DATE&major=&resrDutyExcYn=&eodwYn=&sortField=DATE&staArea=&sortOrderBy=DESC&keyword=&termSearchGbn=&carrEssYns=&benefitSrchAndOr=O&disableEmpHopeGbn=&webIsOut=job&actServExcYn=&maxPay=&keywordStaAreaNm=N&emailApplyYn=&listCookieInfo=DTL&pageCode=&codeDepth1Info=11000&keywordEtcYn=&publDutyExcYn=&keywordJobCdSeqNo=&exJobsCd=&templateDepthNmInfo=&computerPreferential=&regDateStdt=&employGbn=&empTpGbcd=1&region=&infaYn=&resultCntInfo=10&siteClcd=all&cloDateEndt=&sortOrderByInfo=DESC&currntPageNo=19&indArea=&careerTypes=&searchOn=&tlmgYn=&subEmpHopeYn=&academicGbn=&templateDepthNoInfo=&foriegn=&mealOfferClcd=&station=&moerButtonYn=&holidayGbn=&enterPriseGbn=&academicGbnoEdu=&cloTermSearchGbn=&keywordWantedTitle=N&stationNm=&benefitGbn=&keywordFlag=&essCertChk=N&isEmptyHeader=&depth2SelCode=&_csrf=4e7cd243-f7fc-46fb-9019-1e38e74acbe3&keywordBusiNm=N&preferentialGbn=&rot3WorkYn=&pfMatterPreferential=&regDateEndt=&staAreaLineInfo1=11000&staAreaLineInfo2=1&pageIndex=" + str(pageno) + "&termContractMmcnt=&careerFrom=&laborHrShortYn=#viewSPL"
        response = requests.get(work_net,headers=agent_head)
        soup = BeautifulSoup(response.text, "html.parser")
        table_row = soup.select_one("#mForm > div.table-wrap > table > tbody")
        companyList = table_row.select('tr')
        for company in companyList:
            #사이트명
            rec_name = 
            #업체 이름
            cp_name = company.select_one('a.cp_name').text.strip()
            #모집 공고 세부 사항 주소
            info_url = company.select_one('div.cp-info-in > a')['href']
            print(info_url)
worknet()
            #모집 공고 등록 일자
            date = company.select_one('td:nth-child(5) > div > p:nth-child(2)').text.strip().split()[0]
            
            '''
            date = company.select_one('td:nth-child(5) > div > p:nth-child(2)')
            date = date.text
            date = date.strip()
            date = date.split()
            date = date[0]
            '''
            
            #회사명, 공고 세부 주소, 등록일자
            data = {
                'cp_name':cp_name,
                'info_url':info_url,
                'date':date
                }
            #리스트로 작성
            list.append(data)

    #데이터 프레임 넣기
    df = DataFrame(list)
    #csv 파일로 저장한다.
    filename = 'D:\\CTEAM\\1worknet.csv'
    df.to_csv(filename, encoding="utf-8-sig", index=False)
    return

worknet()