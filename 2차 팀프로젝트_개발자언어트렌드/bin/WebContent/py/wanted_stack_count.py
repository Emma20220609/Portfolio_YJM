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
            
			#details_raw의 값을 가져옴
			stack_list = dic[colname]

			#stack_list를 보내 카운트된 딕셔너리를 받음
			stack_dic = self.count(stack_list)

			#stack_dic의 키 값 쌍을 기존 딕셔너리에 추가
			for key in stack_dic.keys():
				dic[key] = stack_dic[key]
			self.reset_count()
            
			#'details_raw' 키 값 쌍을 삭제
			del dic['details_raw']
			
            #'raw_no' 키 값 쌍을 삭제
			del dic['raw_no']
#			if dic['rec_date'] is None :
#				del dic['rec_date']
#			print(type(dic['rec_date'])) 
#			print(dic)
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
		self.count_flag += 1
		self.reset_count()
		print("="*50+"\n count :"+str(self.count_flag))
	#	print(type(list))
		for item in list :
		#	print(item)
			if 'C' == item :
				self.count_dic['stack_1']	 = 1
			if 'C++' == item :
				self.count_dic['stack_2']	 = 1
			if 'C#' == item :
				self.count_dic['stack_3']	 = 1
			if 'Java' == item :
				self.count_dic['stack_4']	 = 1
			if 'JavaScript' == item :
				self.count_dic['stack_5']	 = 1
			if 'Python' == item :
				self.count_dic['stack_6']	 = 1
			if 'VB' == item :
				self.count_dic['stack_6']	 = 1
		return self.count_dic

	def set_pre(self, str_content):
		result = []
		str_content	= str_content.replace("[", "")
		str_content	= str_content.replace("]", "")
		str_content	= str_content.replace(" ", "")
		str_content	= str_content.replace("'", "")
		result 		= str_content.split(",")
		return result