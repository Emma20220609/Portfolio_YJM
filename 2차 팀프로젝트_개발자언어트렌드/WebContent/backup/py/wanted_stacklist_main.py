import DBManager as DB
import pandas as pd
import numpy as np
from stack_count import ReadStack

class countStack :
	def recList(self,table_name, key, value):
	# DB에서 읽어 파일로 저장
		db = DB.DBManager()
		db.setWhere(key, value)
		df = db.GetDF(table_name)
		filename = 'D:\\CTEAM\\DataLab\\WebContent\\py\\wanted_list.csv'
		df.to_csv(filename,encoding="utf-8-sig", index=False)
		breakpoint()
	#=============================================================

	# 파일에서 읽어오고, 리스트로 변환
		filename = 'D:\\CTEAM\\DataLab\\WebContent\\py\\wanted_list.csv'
		df = pd.read_csv(filename ,encoding="utf-8-sig")
		df = df.replace({np.nan: None})
	# df를 저장할 리스트
		list_from_df = []
	# df를 리스트로 변환
		for row, columns in df.iterrows():
			line = df.iloc[row]
			tmp  = line.to_dict()
			list_from_df.append(tmp)

		list_to_recAnalysis=[]
		#생성자
		rs= ReadStack()
		list_to_recAnalysis = rs.ReadDB("details_raw", list_from_df)
		#db.SetList("recAnalysis",list_to_recAnalysis)

'''
		tmp_list = []
		count = -1
		for item in list_to_recAnalysis :
			count += 1
			if count > 2 :
				break
			tmp_list.append(item)
		for item in tmp_list :
		#	print(item)
		#	print(item['details'])

			print(
				"C :"			 + str(item['stack_1']),
				"C++ :"			 + str(item['stack_2']),
				"C# :"			 + str(item['stack_3']),
				"Java :"		 + str(item['stack_4']),
				"JavaScript :"	 + str(item['stack_5']),
				"Python :"		 + str(item['stack_6']),
				"VB :"			 + str(item['stack_7'])
				)

#		db.SetList("recAnalysis",tmp_list)
	# 테스트용으로 리스트를 줄인다
		tmp_list = []
		count = -1
		for item in list_from_df :
			count += 1
			if count > 2 :
				break
			tmp_list.append(item)
		list_from_df = tmp_list
'''

cs = countStack()
cs.recList('recList', 'rec_name', 'WORK_NET')