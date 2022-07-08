import requests
from bs4 import BeautifulSoup

class Saramin :
	def __init__(self):
		#URL 앞부분
		self.URL_pre = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&loc_mcd=101000%2C113000&cat_mcls=2&recruitPage="
		#URL 뒷부분
		self.URL_nex = "&recruitSort=reg_dt&recruitPageCount=10&inner_com_type=&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&searchword=&show_applied=&quick_apply=&except_read=&ai_head_hunting=&mainSearch=n"
		#agent_head
		self.agent_head = {
			"user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
			"accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
			}

	def set_URL(self,URL):
		self.URL = URL

	def make_soup(self,page,URL=None):
		if URL is None :
			makeURL =  self.URL_pre + str(page) + self.URL_nex
		else :
			makeURL = URL
		self.response = requests.get(makeURL, headers = self.agent_head)
		return BeautifulSoup(self.response.text, "html.parser")

	def get_total(self):
		pagecount = 10
		soup = self.make_soup(1)
		# |숫자 카운팅의 불필요한 한글 제거|
		totalCount = soup.select_one('#recruit_info > div.header > span').text
		totalCount = totalCount.replace(" ", "").replace(",", "").replace("총", "").replace("건", "")
		# |전체 페이지 계산|
		totalpage = (int(totalCount) // pagecount) + 1
		return totalpage

	#recRaw에 넣을 데이터 만들기
	def make_raw(self) :
		#[[============================================================================================
		# 전체 페이지 수를 구함
		totalpage = self.get_total()
		print('-',totalpage,'-까지 수집해야 합니다.')
		#============================================================================================]]

#		for pageno in range(1, totalpage+1) :
		for pageno in range(1, 2) :
			#[[============================================================================================
			soup = self.make_soup(pageno)
			for line in soup.select('script'):
				line.extract()
			#============================================================================================]]
			# 총 10개의 그룹으로 묶여 모집 공고가 올라옴
			for index in range(1, 11) :
				#[[============================================================================================
				# recruit_info_list 아래 10개의 child
				rec_list = soup.select('#recruit_info_list > div.content > div:nth-child('+ str(index) +')')
				#============================================================================================]]

				# 각 child 마다 a tag를 찾아 href를 읽어온다
				for recruit in rec_list :
					#[[============================================================================================
					# a tag에서 href 추출
					str_href = recruit.select_one('div.area_job > h2 > a')['href']
					#href 속성 값에서 고유번호 추출
					str_SN = str_href[50:58]
					#모집공고 고유 주소
					contents_URL = "https://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=" + str_SN
					#============================================================================================]]

					#[[============================================================================================
					#각 모집 공고 고유 주소로 들어가 bs4 객체를 만들고 스크립트를 삭제한다
					soup = self.make_soup(URL=contents_URL)
					for line in soup.select('script'):
						line.extract()
					#============================================================================================]]

					#[[============================================================================================
					# <meta name="description" content="~~~~~~~~~~~~">에서 content의 값을 ','로 나눠 배열로 만듬
					list_str_parse = soup.find('meta', attrs = {'name':'description'})['content'].split(",")
					#============================================================================================]]

					#[[============================================================================================
					# 모집 공고 상세 주소
					content_raw_url = "https://www.saramin.co.kr/zf_user/jobs/relay/view-detail?rec_idx=" + str_SN
					#각 모집 공고 상세에서 불필요한 태그를 삭제한다
					soup = self.make_soup(URL=content_raw_url)
					for line in soup.select('script'):
						line.extract()
					#============================================================================================]]
					# 데이터를 딕셔너리에 넣는다
					#[[============================================================================================
					self.data_dic['rec_name']		= 'SARAM_IN'
					self.data_dic['com_name']		= list_str_parse[0]
					self.data_dic['contents_URL']	= contents_URL
					self.data_dic['content_raw']	= soup
					#============================================================================================]]
					self.data_list.append(self.data_dic)
					self.data_dic = {}
				db = DB.DBManager()
				db.SetList("recRaw",self.data_list)
				self.data_list = []