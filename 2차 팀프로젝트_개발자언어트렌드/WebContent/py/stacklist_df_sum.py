import DBManager as DB
import pandas as pd
import numpy as np
from stack_count import ReadStack
from pandas import DataFrame, Series
import json

class countStack :
	def recList(self,table_name,key,value):
	#	DB에서 읽어 파일로 저장
		db = DB.DBManager()
		db.setWhere(key, value)
		df_raw = db.GetDF(table_name)
		df=df_raw[["stack_1","stack_2","stack_3","stack_4","stack_5","stack_6","stack_7"]]
		
		
		df=df.rename(columns={
			'stack_1':'C',
			'stack_2':'C++',
			'stack_3':'C#',
			'stack_4':'Java',
			'stack_5':'JavaScript',
			'stack_6':'Python',
			'stack_7':'VB'
			})
		
		#filename = 'D:\\hanok\\team\\2ndProject\\data\\stackanalyze.csv'
		#df.to_csv(filename, encoding="utf-8-sig", index=False)
		
		
		# print(df)
		df["C"].sum()
		df["C++"].sum()
		df["C#"].sum()
		df["Java"].sum()
		df["JavaScript"].sum()
		df["Python"].sum()
		df["VB"].sum()

		total = {
					"C" 		 : str(df["C"].sum()),
					"C++" 		 : str(df["C++"].sum()),
					"C#" 		 : str(df["C#"].sum()),
					"Java"	 	 : str(df["Java"].sum()),
					"JavaScript" : str(df["JavaScript"].sum()),
					"Python" 	 : str(df["Python"].sum()),
					"VB" 		 : str(df["VB"].sum()),
		}
		total = json.dumps(total)
		#print(total)
		filename = "D:\\CTEAM\\DataLab\\WebContent\\text_count.json"
		with open(filename,'w') as f :
				json.dump(total, f)

		with open(filename,'r') as r :
			total = json.load(r)
			

		#total.to_Json("D:\CTEAM\DataLab\WebContent\text_count.json")
		#df.to_json("D:\CTEAM\DataLab\WebContent\text_count.json", orient = 'table')
		'''
		stack_1 = df["stack_1"].sum()
		stack_2 = df["stack_2"].sum()
		stack_3 = df["stack_3"].sum()
		stack_4 = df["stack_4"].sum()
		stack_5 = df["stack_5"].sum()
		stack_6 = df["stack_6"].sum()
		stack_7 = df["stack_7"].sum()
		print("stack_1 #'C' :" + str(stack_1))
		print("stack_2 #'C++' :" + str(stack_2))
		print("stack_3 #'C#' :" + str(stack_3))
		print("stack_4 #'Java' :" + str(stack_4))
		print("stack_5 #'JavaScript' :" + str(stack_5))
		print("stack_6 #'Python' :" + str(stack_6))
		print("stack_7 #'VB' :" + str(stack_7))
		'''
cs = countStack()
cs.recList('recAnalysis', 'rec_name', 'wanted')

