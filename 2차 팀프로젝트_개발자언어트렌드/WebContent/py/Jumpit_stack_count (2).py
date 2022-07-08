class ReadStack :
	count_dic = {
		'stack_1'		 : 0,		#'C'
		'stack_2'		 : 0,		#'C++'
		'stack_3'		 : 0,		#'C#'
		'stack_4'		 : 0,		#'Java'
		'stack_5'		 : 0,		#'JavaScript'
		'stack_6'		 : 0,		#'Python'
		'stack_7'		 : 0		#'VB'
	}
	count_flag = -1

	def remove_None(self,dic):
		for key in list(dic.keys()):
			if dic[key] is None :
				del dic[key]

	def ReadDB(self,colname,list):
		for dic in list :
			self.remove_None(dic)
#			print(dic.keys())
			#기존 딕셔너리에 키, 값 쌍을 추가 
			#디테일스 키에 content값를 추가
			dic['details'] = dic['details_raw']
#			print(dic)
			#details_raw의 값을 가져옴
			stack_list = dic[colname]
			#stack_list를 보내 카운트된 딕셔너리를 받음
			dic['stack_etc'] = self.count(stack_list)
			stack_dic = self.count_dic
			#stack_dic의 키 값 쌍을 기존 딕셔너리에 추가

			for key in stack_dic.keys():
				dic[key] = stack_dic[key]
			self.reset_count()
			#'details_raw' 키 값 쌍을 삭제
			del dic['details_raw']
			#'raw_no' 키 값 쌍을 삭제
			del dic['raw_no']
		return list

	def reset_count(self):
		self.count_dic['stack_1']	= 0		#'C'
		self.count_dic['stack_2']	= 0		#'C++'
		self.count_dic['stack_3']	= 0		#'C#'
		self.count_dic['stack_4']	= 0		#'Java'
		self.count_dic['stack_5']	= 0		#'JavaScript'
		self.count_dic['stack_6']	= 0		#'Python'
		self.count_dic['stack_7']	= 0		#'VB'

	def count(self,list):
		list = self.set_pre(list)
	#	print(list)
	#	print(type(list))
		self.count_flag += 1
		self.reset_count()
		print("="*50+"\n count :"+str(self.count_flag))
	#	print(type(list))
		print("원본 리스트" + str(list))
		for item in list :
			if 'C' == item :
				self.count_dic['stack_1']	 = 1
				del list[list.index(item)]
			if 'C++' == item :
				self.count_dic['stack_2']	 = 1
				del list[list.index(item)]
			if 'C#' == item :
				self.count_dic['stack_3']	 = 1
				del list[list.index(item)]
			if 'Java' == item :
				self.count_dic['stack_4']	 = 1
				del list[list.index(item)]
			if 'JavaScript' == item :
				self.count_dic['stack_5']	 = 1
				del list[list.index(item)]
			if 'Python' == item :
				self.count_dic['stack_6']	 = 1
				del list[list.index(item)]
			if 'VB' == item :
				self.count_dic['stack_7']	 = 1
				del list[list.index(item)]
		print("원본에서 삭제된 리스트 " + str(list))
		print("카운트 한 태크스택 딕셔너리 " + str(self.count_dic))

		return list

	def set_pre(self, str_content):
		result = []
		str_content	= str_content.replace("[", "")
		str_content	= str_content.replace("]", "")
		str_content	= str_content.replace(" ", "")
		str_content	= str_content.replace("'", "")
		str_content	= str_content.replace("<stack>", "")
		str_content	= str_content.replace("</stack>", "")
		result 		= str_content.split(",")
		return result