"""
작성자 : 함경환
작성일 : 2022년 6월 30일 오전 10시 35분
"""

import DBManager as DB
import pandas as pd
import numpy as np
import recAnalysis as RA

class comuAnalysis_main :
	parse_data_table_name	= ""
	column_name				= ""
	column_value			= ""
	target_table_name		= ""
	file_path				= ""
	file_name				= ""
	file_full_path			= ""
	parse_data_list			= []
	Analysis_data_list		= []

	def __init__(self,column_name,column_value):
	#===========================================================================================
	# 생성자 comuAnalysis 용으로 기본 값을 넣는다
		self.parse_data_table_name	= "recList"
		self.column_name			= column_name
		self.column_value			= column_value
		self.target_table_name		= "recAnalysis"
		self.file_path				= 'D:\\CTEAM\\DataLab\\WebContent\\py\\'
		self.file_name				= self.column_value + '.csv'
		self.file_full_path			= self.file_path + self.file_name
	#	print(self.file_path + self.file_name)
	#===========================================================================================

	def make_file(self):
	#===========================================================================================
	# DB에서 읽어 파일로 저장
		db = DB.DBManager()
		db.setWhere(self.column_name, self.column_value)
		df = db.GetDF(self.parse_data_table_name)
		df.to_csv(self.file_full_path,encoding="utf-8-sig", index=False)
		db.DBClose()
	#===========================================================================================

	def read_file(self):
	#===========================================================================================
	# 파일에서 읽어오고, 리스트로 변환
		df = pd.read_csv(self.file_full_path ,encoding="utf-8-sig")
		df = df.replace({np.nan: None})
	# df를 저장할 리스트
		list_from_df = []
	# df를 리스트로 변환
		for row, columns in df.iterrows():
			line = df.iloc[row]
			tmp  = line.to_dict()
			list_from_df.append(tmp)
		return list_from_df
	#===========================================================================================

	def read_DB(self):
	#===========================================================================================
	# DB에서 읽어오는 경우
		db = DB.DBManager()
		# where 설정
		db.setWhere(self.column_name, self.column_value)
		# 원본 데이터가 있는 테이블 이름을 파라메터로 받아서 GetList()로 받아온다
		list_from_DB = db.GetList(self.parse_data_table_name)
		db.DBClose()
		return list_from_DB
	#===========================================================================================

	def insert_DB(self,data_list):
	#===========================================================================================
	# DB에 리스트를 저장한다
		db = DB.DBManager()
		db.SetList(self.target_table_name,data_list)
		db.DBClose()
	#===========================================================================================

	def main(self) :
	#===========================================================================================
	# 파일이 존재하면, 파일에서 읽어오고, 없으면 DB에서 읽어 파일을 생성한다.
		try :
		#	파일에서 문제없이 읽어오면, parse_data_list에 데이터를 넣는다
			parse_data_list = self.read_file()
			self.parse_data_list = parse_data_list
			print("="*50 + "\n" + self.file_path + self.file_name + " 을 읽어왔습니다.")
		except Exception as e :
		#	Exception 메세지 출력
			print("="*50 + "\n" + self.file_path + self.file_name + " 을 읽어오지 못했습니다.")
			print(e)
			print("="*50)
		#	파일에서 읽어지지 않으면, 파일을 생성해본다.
			try :
			#	파일을 생성하고
				self.make_file()
			#	읽어지면, parse_data_list에 데이터를 넣는다
				parse_data_list = self.read_file()
				self.parse_data_list = parse_data_list
				print("="*50 + "\n" + self.file_path + self.file_name + " 을 읽어왔습니다.")
			except Exception as e :
			#	파일 생성이 안되거나, 파일에서 읽는것이 실패하면, DB에서 바로 읽는다.
				print("="*50 + "\n" + self.file_path + self.file_name + " 을 생성하지 못하거나, 읽지 못했습니다.")
				print(e)
				print("="*50)
				try :
					parse_data_list = self.read_DB()
					self.parse_data_list = parse_data_list
					print("="*50 + "\n DB에서 읽어왔습니다.")
				except Exception as e :
				#	DB에서도 읽지 못하는 경우
					print("="*50 + "\n" + self.parse_data_table_name + "에서 " + self.column_value +"를 읽어오지 못했습니다.")
					print(e)
					print("="*50)
		print("="*50)
	#	print(self.parse_data_list)
		list_to_recAnalysis = self.parse_data_list

		#생성자
		ra = RA.comuAnalysis()
		list_to_recAnalysis = ra.main("details_raw", list_to_recAnalysis)
		print("="*50)
	#	print(list_to_recAnalysis)
		self.insert_DB(list_to_recAnalysis)
	#===========================================================================================

# wanted	= comuAnalysis_main("rec_name","wanted")
# Jumpit	= comuAnalysis_main("rec_name","Jumpit")
worknet	= comuAnalysis_main("rec_name","WORK_NET")

#wanted.main()
# Jumpit.main()
worknet.main()
