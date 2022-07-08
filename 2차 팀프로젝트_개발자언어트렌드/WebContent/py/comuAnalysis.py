"""
작성자 : 함경환
작성일 : 2022년 6월 29일 오후 5시 10분
"""

import word_list as wl
import re
from bs4 import BeautifulSoup

class comuAnalysis :
	stack_dic	= {
		'stack_1'	: 0,		#'C'
		'stack_2'	: 0,		#'C++'
		'stack_3'	: 0,		#'C#'
		'stack_4'	: 0,		#'Java'
		'stack_5'	: 0,		#'JavaScript'
		'stack_6'	: 0,		#'Python'
		'stack_7'	: 0			#'VB'
	}
	word_like	= "on"

	#===========================================================================================

	def reset_stack_dic(self):
	# stack_dic 초기화
	#===========================================================================================
		self.stack_dic['stack_1']	= 0		#'C'
		self.stack_dic['stack_2']	= 0		#'C++'
		self.stack_dic['stack_3']	= 0		#'C#'
		self.stack_dic['stack_4']	= 0		#'Java'
		self.stack_dic['stack_5']	= 0		#'JavaScript'
		self.stack_dic['stack_6']	= 0		#'Python'
		self.stack_dic['stack_7']	= 0		#'VB'
	#===========================================================================================

	def remove_None(self,dic):
	# dic에서 value가 'None'인 key,value 쌍 삭제
	#===========================================================================================
		for key in list(dic.keys()):
			if dic[key] is None :
				del dic[key]
	#===========================================================================================

	def count_stack(self,list):
	# list에서 상위 7개 언어를 카운트하고 list에서 삭제한다
	# 카운트한 7개 언어는 self.stack_dic 에 저장한다
	#===========================================================================================
	#	전처리
		list = self.set_pre(list)
		# stack_dic 을 초기화한다.
		self.reset_stack_dic()
	#	테크스택을 만들면서, 기존 List에서는 제거한다.
		stack_etc_list = []
		p = re.compile('C[\+\#\-\=A-Z]')
		for item in list :
			flag = 0
	#	word_list의 stack_list로 처리한다
			for key, value in wl.stack_list.items():
				if item.startswith("C") and not p.match(item) :
					self.stack_dic['stack_1'] = 1
					flag = 1
				elif item.startswith(key) :
					self.stack_dic[value] = 1
					flag = 1
	#	리스트의 원소가 stack_list에 열거된 항목 중에 없을 경우
			if flag == 0 :
				stack_etc_list.append(item)
	#	리턴되는 리스트는, stack_list에 열거된 항목을 추출하고 남은 기타 항목
		return stack_etc_list
	#===========================================================================================

	def set_pre(self, str_content):
	# 문자열을 받아, 전처리 한다.
	# 유의어가 필요한 경우에는 처리한다
	#===========================================================================================
		result = []
	#	print(str_content)
		str_content	= str_content.replace(u'\xa0',	u''	)
		str_content	= str_content.replace('xa0',	''	)
		str_content	= str_content.replace("\n",		" "	)
		str_content	= str_content.replace("\r",		" "	)
		str_content	= str_content.replace("'",		" "	)
		str_content	= str_content.replace('"',		" "	)
		str_content	= str_content.replace(',',		" "	)
		str_content	= str_content.replace('.',		""	)
		str_content	= str_content.replace("[",		""	)
		str_content	= str_content.replace("]",		""	)
		str_content	= str_content.upper()
		str_content	= str_content.replace("<STACK>", "")
		str_content	= str_content.replace("</STACK>", "")
	#	유의어 사전으로 처리한다
		if self.word_like is not None:
			for key, value in wl.word_like.items():
				for item in value:
					str_content	= str_content.replace(item, key)
		result		= str_content.split(" ")
		return self.remove_NULL(result)
	#===========================================================================================

	def remove_NULL(self,list):
	#===========================================================================================
		deleted_NULL_list = []
		while list :
			item = list.pop()
			if item != '':
				deleted_NULL_list.append(item)
		return deleted_NULL_list
	#===========================================================================================

	def getTEXT(self,value):
	#===========================================================================================
		str_content = value
		soup = BeautifulSoup(str_content, "html.parser")
		for s in soup.select('script'):
			s.extract()
		for s in soup.select('style'):
			s.extract()
		list = soup.select('p')
		result = ""
		for line in list :
			result += line.text + "\n"
		return result
	#===========================================================================================

	def main(self,colname,list):
	#===========================================================================================
		for dic in list :
			self.remove_None(dic)
	#		기존 딕셔너리에 키, 값 쌍을 추가 
	#		replys 키에 replys_raw 값을 추가
			dic['replys'] = dic['replys_raw']
	#		딕셔너리에서 colname 키의 값을 가져옴
			stack_list = dic[colname]
			stack_str = self.getTEXT(stack_list)
			dic["contents"] = stack_str
	#		stack_list를 보내 카운트된 딕셔너리를 받음
			dic["stack_etc"] = self.count_stack(stack_str)
	#		stack_dic의 키 값 쌍을 기존 딕셔너리에 추가
			for key in self.stack_dic.keys():
				dic[key] = self.stack_dic[key]
			self.reset_stack_dic()
	#		'contents_raw' 키 값 쌍을 삭제
			del dic['contents_raw']
	#		'raw_no' 키 값 쌍을 삭제
			del dic['raw_no']
	#		'replys_raw' 키 값 쌍을 삭제
			del dic['replys_raw']
		return list
	#===========================================================================================