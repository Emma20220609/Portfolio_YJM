from logging import exception
from regex import E
import DBManager as DB

# 원본 DB
db_x920 = DB.DBManager()
# 백업 DB
db_n54l = DB.DBManager("192.168.0.200")

# DB 테이블 이름 리스트
table_name_list = [
	'portal',
	'recRaw',
	'recList',
	'recAnalysis',
	'comuRaw',
	'comuList',
	'comuAnalysis',
	'reply',
]

# 테이블 이름 리스트에서 테이블 이름으로 반복한다.
for table_name in table_name_list :
	print("cheack backup DB : " + table_name)
	try :
	#	테이블 이름으로 백업 DB에서 읽어온 데이터가 존재하면, 다음 테이블로 넘어간다	
		data_list = db_n54l.GetList(table_name)
		print("cheack backup DB : " + table_name + " data = " + str(len(data_list)))
		if len(data_list) > 0 :
			continue
		else :
	#	백업 DB에서 넘어온 데이터가 없으면
			try :
				print("getList from : " + table_name)
			#	원본 DB에서 데이터를 읽어오고, 데이터가 존재하면, 백업 DB에 데이터를 옮긴다. 
				data_list_from_ori = db_x920.GetList(table_name)
				print("getList from : " + table_name + " data = " + str(len(data_list_from_ori)))
				if len(data_list_from_ori) > 0 :
					try :
						for dic in data_list_from_ori :
							for key in list(dic.keys()):
								if dic[key] is None :
									del dic[key]
						print("SetList to backup DB : " + table_name)
						db_n54l.SetList(table_name,data_list_from_ori)
					except Exception as e :
						print(e)
			except Exception as e :
				print(e)
	except Exception as e :
		print(e)