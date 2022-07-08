import word_list as wl
from bs4 import BeautifulSoup

class comuAnalysis :
	count_dic = {
		'stack_1'	: 0,		#'C'
		'stack_2'	: 0,		#'C++'
		'stack_3'	: 0,		#'C#'
		'stack_4'	: 0,		#'Java'
		'stack_5'	: 0,		#'JavaScript'
		'stack_6'	: 0,		#'Python'
		'stack_7'	: 0			#'VB'
	}
	count_flag = -1
	#===========================================================================================

	def reset_count_dic(self):
	#===========================================================================================
	# count_dic 초기화
		self.count_dic['stack_1']	= 0		#'C'
		self.count_dic['stack_2']	= 0		#'C++'
		self.count_dic['stack_3']	= 0		#'C#'
		self.count_dic['stack_4']	= 0		#'Java'
		self.count_dic['stack_5']	= 0		#'JavaScript'
		self.count_dic['stack_6']	= 0		#'Python'
		self.count_dic['stack_7']	= 0		#'VB'
	#===========================================================================================

	def remove_None(self,dic):
	#===========================================================================================
	# dic에서 value가 'None'인 key,value 쌍 삭제
		for key in list(dic.keys()):
			if dic[key] is None :
				del dic[key]
	#===========================================================================================

	def count_stack(self,list):
	#===========================================================================================
	# list에서 상위 7개 언어를 카운트하고 list에서 삭제한다
	# 카운트한 7개 언어는 self.count_dic 에 저장한다
		# 전처리
		list = self.set_pre(list)
		# count_dic 을 초기화한다.
		self.reset_count_dic()
		# 몇번째 데이터를 처리하는지 출력
	#	self.count_flag += 1
	#	print("="*50+"\n count :"+str(self.count_flag))
	#	테크스택을 만들면서, 기존 List에서는 제거한다.
		stack_etc_list = []
		for item in list :
			flag = 0
			for key, value in wl.stack_list.items():
				if item.startswith(key) :
					self.count_dic[value] = 1
					flag = 1
			if flag == 0 :
				stack_etc_list.append(item)
		return stack_etc_list

# 		for item in list :
# 			if item.startswith('C_') :
# 				self.stack_dic['stack_1'] = 1
# 				del list[list.index(item)]
# 			if item.startswith('C++') :
# 				self.stack_dic['stack_2'] = 1
# 				del list[list.index(item)]
# 			if item.startswith('C#') :
# 				self.stack_dic['stack_3'] = 1
# 				del list[list.index(item)]
# 			if item.startswith('JAVA') :
# 				self.stack_dic['stack_4'] = 1
# 				del list[list.index(item)]
# 			if item.startswith('JS_') :
# 				self.stack_dic['stack_5'] = 1
# 				del list[list.index(item)]
# 			if item.startswith('PYTHON') :
# 				self.stack_dic['stack_6'] = 1
# 				del list[list.index(item)]
# 			if item.startswith('VB') :
# 				self.stack_dic['stack_7'] = 1
# 				del list[list.index(item)]'''

	def set_pre(self, str_content, word_like=None):
		result = []
		print(str_content)
		str_content	= str_content.upper()
		str_content	= str_content.replace(u'\xa0',	u'')
		str_content	= str_content.replace("\n",	"")
		str_content	= str_content.replace("\r",	"")
		str_content	= str_content.replace("'",	" ")
		str_content	= str_content.replace('"',	" ")
		str_content	= str_content.replace(',',	" ")
		str_content	= str_content.replace('.',	"")
		str_content	= str_content.replace("[",	"")
		str_content	= str_content.replace("]",	"")
		str_content	= str_content.replace("<STACK>", "")
		str_content	= str_content.replace("</STACK>", "")
		# 유의어 사전으로 처리한다
		if word_like is not None:
			for key, value in wl.word_like.items():
				for item in value:
					str_content	= str_content.replace(item, key)
		result		= str_content.split(" ")
	#	print(result)
		return result

	def getValue(self,value):
		str_content = value
		soup = BeautifulSoup(str_content, "html.parser")
		for s in soup.select('script'):
			s.extract()
		for s in soup.select('style'):
			s.extract()
		return soup.text

	def main(self,colname,list):
		for dic in list :
			self.remove_None(dic)
#			print(dic.keys())
			#기존 딕셔너리에 키, 값 쌍을 추가 
			#디테일스 키에 content값를 추가
			dic['replys'] = dic['replys_raw']
			#details_raw의 값을 가져옴
			stack_list = dic[colname]
			#stack_list를 보내 카운트된 딕셔너리를 받음
			dic["stack_etc"] = self.count_stack(stack_list)
			#count_dic의 키 값 쌍을 기존 딕셔너리에 추가
			for key in self.count_dic.keys():
				dic[key] = self.count_dic[key]
			self.reset_count_dic()
			#'details_raw' 키 값 쌍을 삭제
			del dic['contents_raw']
			#'raw_no' 키 값 쌍을 삭제
			del dic['raw_no']
			del dic['replys_raw']
#			if dic['rec_date'] is None :
#				del dic['rec_date']
#			print(type(dic['rec_date'])) 
#			print(dic)
		return list