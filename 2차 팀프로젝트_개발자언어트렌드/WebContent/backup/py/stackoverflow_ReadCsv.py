from calendar import month
from re import I
from pandas import DataFrame, Series
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rc
import DBManager as DB

class stackoverflow :
	Cumulative_list = []
	Cumulative_data = {
		'Month'		 : '2022-06-01',
		'Tag'		 : 'c# questions',
		'Cumulative' : '1541873'
		}
	stack_list = {
		'C'		 : 	'c questions',
		'C++'	 : 	'c++ questions',
		'C#'	 : 	'c# questions',
		'JAVA'	 : 	'java questions',
		'JS_'	 : 	'javascript questions',
		'PYTHON' : 	'python questions',
		'VB'	 : ['vb6 questions',
					'vb.net questions']
	}
	data_to_DB = {}
		# 'portal_date'	: '' ,
		# 'portal_name'	: 'stackoverflow' ,
		# 'portal_lang'	: '' ,
		# 'portal_count': '' ,
		# 'stack_1'		: '' ,
		# 'stack_2'		: '' ,
		# 'stack_3'		: '' ,
		# 'stack_4'		: '' ,
		# 'stack_5'		: '' ,
		# 'stack_6'		: '' ,
		# 'stack_7'		: '' ,
		# 'stack_etc'	: '' ,
		# 'word_net'	: '' ,
		# 'word_list'	: '' ,
		# 'ETC'			: '' 

	def main(self,table_name,portal_name) :
		db = DB.DBManager()
		filename = 'D:\\CTEAM\\2nd Project\\joe\\SOFTotal.csv'
		df = pd.read_csv(filename , encoding="utf-8-sig")

		#정보가 없는 특정 행 삭제 (-------)
		# df = df.drop([0], axis = 0)
		# df = df.drop([671], axis = 0)

		#정보가 없는 데이터 삭제
		df = df.dropna()
		#날짜형식으로 변경
		#df["Month"] =  pd.to_datetime(df["Month"])
		#df = df.astype({'Cumulative':'int64'})
		# df를 저장할 리스트   
		list_for_DB = []
		# df를 리스트로 변환
		for row, columns in df.iterrows():
			line = df.loc[row]
			data  = line.to_dict()
			self.Cumulative_list.append(data)

		# for self.Cumulative_data in self.Cumulative_list :
		# 	print(self.Cumulative_data)

		for dic in self.Cumulative_list:
			self.data_to_DB['portal_date']	= dic['Month']
			self.data_to_DB['portal_lang']	= dic['Tag']
			self.data_to_DB['portal_count']	= dic['Cumulative']
			self.data_to_DB['portal_name']	= 'stackoverflow'
		#	print(self.data_to_DB)
			list_for_DB.append(self.data_to_DB)
			self.data_to_DB = {}
		db.SetList("portal", list_for_DB)


	# 	datalist = []
	# 	#print(list_from_df)
	# 	'''for dic in list_from_df :
	# 		#print(line)
	# 		if dic['Tag'] == 'c# questions' :
	# 			datalist.append(dic)
	# 	print(datalist)'''

	# 	for value in self.stack_list.values():
	# 		if str(type(value)) == "<class 'list'>" :
	# 			for item in value :
	# 				self.select_dic(item)
	# 		else :
	# 			self.select_dic(value)

	# def select_dic(self, tag_value):
	# 	print(tag_value)
	# 	count_flag = -1
	# 	result_list = []
	# 	for data_dic in self.Cumulative_list :
	# 		count_flag += 1
	# 		if count_flag > 100 :
	# 			break
	# 		if data_dic['Tag'].startswith(tag_value):
	# 			print("dic value " + data_dic['Tag'])
	# 			print("tag value " + tag_value)
	# 			result_list.append(data_dic)
	# 	return result_list
			



			# for self.Cumulative_data in self.Cumulative_list :
			# 		if dic.startswith(value) :
			# 			datalist.append(dic)

			


		'''list = []
		#해당하는 값만 찾기
		c			= df['Tag'].isin(['c questions'])
		c			= df['Tag'].isin(['c questions'])
		cp			= df['Tag'].isin(['c++ questions'])
		ch			= df['Tag'].isin(['c# questions'])
		java		= df['Tag'].isin(['java questions'])
		js			= df['Tag'].isin(['javascript questions'])
		python		= df['Tag'].isin(['python questions'])
		vb6			= df['Tag'].isin(['vb6 questions'])
		vb			= df['Tag'].isin(['vb.net questions'])
		
		
		data = {'get_date'      : '2022-06-18',
				'portal_date'   : '2022-06-18',
											
											
											}


		list.append(df.loc[c],df.loc[cp],df.loc[java],df.loc[python],
		        df.loc[vb6],df.loc[ch],df.loc[js],df.loc[vb])
		
		#print(list)'''
		
		
	def DrawPlot(self,df,title) :
		#그래프 크기 설정
		plt.figure(figsize=(20,10))
		
		#한글 설정 
		rc('font', family='Malgun Gothic')
		
		plt.plot(df[0]["Month"],df[0]["Cumulative"], label="C")
		plt.plot(df[1]["Month"],df[1]["Cumulative"], label="C++")
		plt.plot(df[2]["Month"],df[2]["Cumulative"], label="Java")
		plt.plot(df[3]["Month"],df[3]["Cumulative"], label="Python")
		plt.plot(df[4]["Month"],df[4]["Cumulative"], label="VB6")
		plt.plot(df[5]["Month"],df[5]["Cumulative"], label="C#")
		plt.plot(df[6]["Month"],df[6]["Cumulative"], label="Javascript")
		plt.plot(df[7]["Month"],df[7]["Cumulative"], label="VB.net")
		
		plt.xlabel("연도")
		plt.ylabel("검색량")
		plt.legend()
		plt.title(title)
		plt.show()    
		plt.close()
		return

#st = stackoverflow()

#st.main("portal","stackoverflow")

db = DB.DBManager()

data = db.GetDF('portal')
#print(data['portal_lang'])

js = data.to_json("D:\\CTEAM\\DataLab\\WebContent\\py\\stackOverFlow_test_data.json", orient = 'table')
"""
#해당하는 값만 찾기
c			= data['portal_lang'].isin(['c questions'])
c			= data['portal_lang'].isin(['c questions'])
cp			= data['portal_lang'].isin(['c++ questions'])
ch			= data['portal_lang'].isin(['c# questions'])
java		= data['portal_lang'].isin(['java questions'])
js			= data['portal_lang'].isin(['javascript questions'])
python		= data['portal_lang'].isin(['python questions'])
vb6			= data['portal_lang'].isin(['vb6 questions'])
vb			= data['portal_lang'].isin(['vb.net questions'])


list = [data.loc[c],data.loc[cp],data.loc[java],data.loc[python],
		data.loc[vb6],data.loc[ch],data.loc[js],data.loc[vb]]

data = list
print(data[0]["portal_date"],data[0]["portal_count"])
"""
"""plt.figure(figsize=(20,10))
		
#한글 설정 
rc('font', family='Malgun Gothic')

plt.plot(data[0]["portal_date"],data[0]["portal_count"], label="C")
plt.plot(data[1]["portal_date"],data[1]["portal_count"], label="C++")
plt.plot(data[2]["portal_date"],data[2]["portal_count"], label="Java")
plt.plot(data[3]["portal_date"],data[3]["portal_count"], label="Python")
plt.plot(data[4]["portal_date"],data[4]["portal_count"], label="VB6")
plt.plot(data[5]["portal_date"],data[5]["portal_count"], label="C#")
plt.plot(data[7]["portal_date"],data[7]["portal_count"], label="VB.net")
plt.plot(data[6]["portal_date"],data[6]["portal_count"], label="Javascript")

plt.xlabel("연도")
plt.ylabel("검색량")
plt.legend()
plt.title("StackOverFlow 개발언어별 누적 검색량")
plt.show()    
plt.close()"""

#st.DrawPlot(df,"StackOverFlow 개발언어별 누적 검색량")

