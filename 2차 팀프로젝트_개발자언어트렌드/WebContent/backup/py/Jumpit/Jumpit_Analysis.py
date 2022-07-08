"""
작성자 : 조윤찬
작성일 : 2022년 6월 28일 오후 3시 21분
"""
import DBManager as DB
import pandas as pd
from pandas import DataFrame
from Jumpit_stack_count import ReadStack



def recAnalysis(table_name,key,value,target) :
	JSC = ReadStack()
# DB에서 읽어오는 방법
	db = DB.DBManager()
	db.setWhere(key, value)
	list = db.GetList(table_name)
	list_to_recAnalysis = []
	list_to_recAnalysis = JSC.ReadDB("details_raw", list)
#	print(list_to_recAnalysis)
	db.SetList(target,list_to_recAnalysis)

'''
	for line in list :
		titdata = {
			#DB에서 읽어온 정보
			'list_no'       : line["list_no"],
			'get_date'      : line["get_date"],
			'parse_date'    : line["parse_date"],
			'rec_name'      : line["rec_name"] ,
			'com_name'      : line["com_name"] ,
			'contents_URL'  : line["contents_URL"],
			'title'         : line["title"],
			'content'       : line["content"],
			'details'       : line["details_raw"],
			}


		stack = titdata['details']

		stackcount = JSC.count(stack)
		print(stackcount)
		stack = JSC.set_pre(stack)

		titdata['details'] = stack

		datalist.append(titdata)
		#print(datalist)

		print("="*100)
		print(" setList to " + "recList")
		db.SetList("recAnalysis",datalist)
		datalist=[]
'''

# 커뮤니티 이름 지정
recAnalysis("recList","rec_name","jumpit","recAnalysis")