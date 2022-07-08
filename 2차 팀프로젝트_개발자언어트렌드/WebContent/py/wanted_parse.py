import DBManager as DB

class recParse :
	dic = {
		'raw_no'		: '',
		'get_date'		: '',
		'rec_name'		: '',
		'com_name'		: '',
		'content_raw'	: '',
		'contents_URL'	: ''
		}
	parse_data = {
	#	'list_no'		: 	'',		#리스트일련번호(PK)	
		'raw_no'		: 	'',		#원본일련번호(FK)	
		'get_date'		: 	'',		#수집일자	
	#	'parse_date'	: 	'',		#파싱일자	
		'rec_date'		: 	'',		#공고일자	
		'rec_name'		: 	'',		#사이트명	
		'com_name'		: 	'',		#업체명	
		'contents_URL'	: 	'',		#공고글주소[URL]	
		'title'			: 	'',		#공고글제목	
		'content'		: 	'',		#공고글내용[text]	
		'career'		: 	'',		#신입경력	
		'pay_type'		: 	'',		#급여구분	
		'pay'			: 	'',		#급여금액	
		'recruit_count'	: 	'',		#모집인원	
		'details_raw'	: 	''		#모집상세원본[tag]	
		}
	parse_data_list = []

	def __init__(self):
		self.dic = {}
		self.parse_data = {}

	def recParse(self, table_name, key, value) :

		db = DB.DBManager()
		db.setWhere(key, value)
		#DB에서 읽어온 데이터
		list = db.GetList(table_name)
		#읽어온 데이터를 한줄 씩 처리
		count = -1
		for dic in list :
			count += 1
			''' 넣을 데이터 구조
			self.parse_data = {
				'raw_no'		: #원본일련번호(FK)	
				'get_date'		: #수집일자	
				'rec_date'		: #공고일자	
				'rec_name'		: #사이트명	
				'com_name'		: #업체명	
				'contents_URL'	: #공고글주소[URL]	
				'title'			: #공고글제목	
				'content'		: #공고글내용[text]	
				'career'		: #신입경력	
				'pay_type'		: #급여구분	
				'pay'			: #급여금액	
				'recruit_count'	: #모집인원	
				'details_raw'	: #모집상세원본[tag]	
				}
			'''
			# 읽어온 데이터를 parse_data에 넣는다
			self.parse_data['raw_no']		 = dic['raw_no']			#원본일련번호(FK)
			self.parse_data['get_date']		 = dic['get_date']			#수집일자
		#	self.parse_data['rec_date']		 = 	'rec_date',				#공고일자	
			self.parse_data['rec_name']		 = dic['rec_name']			#사이트명
			self.parse_data['com_name']		 = dic['com_name']			#업체명
			self.parse_data['contents_URL']	 = dic['contents_URL']		#공고글주소[URL]

			#모집상세원본[tag]에서 파싱 ============================================
			details_raw = []
			flag = 0
			for line in dic['content_raw'].split("\n"):
				try :
					if line[0] == '[':
						self.parse_data['title'] = line.split('"')[1]			#공고글제목
				except :
					continue
				if line == "기술스택 ・ 툴":
					flag = 1
					continue
				if line == dic['com_name'] :
					flag = 0
				if flag == 1 :
					details_raw.append(line)
			self.parse_data['content']		 = dic['content_raw']		#공고글내용[text]
		#	self.parse_data['career']		 = 	'career',				#신입경력	
		#	self.parse_data['pay_type']		 = 	'pay_type',				#급여구분	
		#	self.parse_data['pay']			 = 	'pay',					#급여금액	
		#	self.parse_data['recruit_count'] = 	'recruit_count',		#모집인원	
			self.parse_data['details_raw']	 = details_raw				#모집상세원본[tag]
			self.parse_data_list.append(self.parse_data)
			self.parse_data = {}

			if (count+1)%100 == 0 :
#				print(self.parse_data)
#				print("="*100)
#				print(self.parse_data_list)
				print("db.SetList('recList',self.parse_data_list)" + str(count))
				db.SetList("recList",self.parse_data_list)
				self.parse_data_list = []
		print("db.SetList('recList',self.parse_data_list)" + " last============================")
		db.SetList("recList",self.parse_data_list)

rP = recParse()
rP.recParse("recRaw", "rec_name", 'wanted')

'''
	for line in list :
		soup = BeautifulSoup(line["contents_raw"], "html.parser")
		contents = soup.select("#article")
		for content in contents :
			title = content.select_one('div.content-body > h2.panel-title')
			note = content.select_one('article.content-text')
			date= content.select_one('span.timeago')
			hit= content.select_one('div.content-identity.pull-right > div:nth-child(2) ')
			comment= content.select('#article > div:nth-child(5) > ul')
			print(comment)
			titdata = {
				#DB에서 읽어온 정보
				'raw_no' : line["raw_no"],
				'get_date' : line["get_date"],
				'comu_name' : line["comu_name"] ,
				'contents_URL' :line["contents_URL"],
				#"contents_raw"에서 파싱한 정보
				'comu_date':date.text,                            #게시일자
				'title' :title.text,
				'contents' :note.text,
				'view' : hit.text,
				'contents_raw' : line,
				'replys_raw' : comment
				}
			datalist.append(titdata)

		db = DB.DBManager()
		db.SetList("comuList",datalist)
		datalist=[]
'''