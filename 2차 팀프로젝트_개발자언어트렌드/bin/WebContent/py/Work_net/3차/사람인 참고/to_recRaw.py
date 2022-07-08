import requests
import DBManager as DB
import Saramin as SR
from bs4 import BeautifulSoup

class toRaw :
	#URL 앞부분
	URL_pre = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&loc_mcd=101000%2C113000&cat_mcls=2&recruitPage="
	#URL 뒷부분
	URL_nex = "&recruitSort=reg_dt&recruitPageCount=10&inner_com_type=&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&searchword=&show_applied=&quick_apply=&except_read=&ai_head_hunting=&mainSearch=n"
	#agent_head
	agent_head = {
		"user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
		"accept" : "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
		}

	#데이터 딕셔너리와 리스트
	data_dic = {}
	data_list = []

	#recRaw에 넣을 데이터 만들기
	def make_raw(self) :
		#[[============================================================================================
		# 전체 페이지 수를 구함
		totalpage = pg.get_numb()
		print('-',totalpage,'-까지 수집해야 합니다.')
		#============================================================================================]]

		#[[============================================================================================

		#============================================================================================]]
		for pageno in range(1, totalpage+1) :
#		for pageno in range(1, 2) :
			#[[============================================================================================
			#URL 만들기
			URL =  self.URL_pre + str(pageno) + self.URL_nex
			#============================================================================================]]
			#[[============================================================================================
			#request로 연결하고 bs4 객체로 만들어, <script>를 지움
			response = requests.get(URL, headers = self.agent_head)
			soup	 = BeautifulSoup(response.text, "html.parser")
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
					response = requests.get(contents_URL, headers = self.agent_head)
					soup = BeautifulSoup(response.text, "html.parser")
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
					response = requests.get(content_raw_url, headers = self.agent_head)
					soup = BeautifulSoup(response.text, "html.parser")
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

sr = saramin()
sr.make_raw()

