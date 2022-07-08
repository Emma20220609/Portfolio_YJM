"""
작성자 : 함경환
작성일 : 2022년 6월 22일 오전 10시 51분
"""
"""
수정자 : 함경환
수정일 : 2022년 6월 22일 오전 11시 40분
수정 내용 :
	작성
	setList()
	setPreSQL()
	setSQLvalue()
	SQL 구문 생성해주는 메소드
"""
"""
수정자 : 함경환
수정일 : 2022년 6월 22일 오후 1시 28분
수정 내용 :
	_R()
	setList()
	setPreSQL()
	setSQLvalue()
	SQL 구문 "->''처리
"""
"""
수정자 : 함경환
수정일 : 2022년 6월 22일 오후 4시 50분
수정 내용 :
	GetDF()
	리턴 타입으로 데이터프레임 사용
	GetList()
	where 조건 있을때 처리
	__init__()
	self.where 초기화
"""

from logging import exception
from pandas import DataFrame
import pymysql

class DBManager :
	def __init__(self):
		#[[==========================================
		# 생성자, DB에 접속하기 위한 정보를 초기화 한다.
		self.host       = "silverwoods.synology.me"
		self.userId     = "CTEAM"
		self.passwd     = "E2en_java_(team"
		self.db_name    = "datalab"
		self.where      = ""
		#==========================================]]

	def DBOpen(self):
		#[[==========================================
		# DB 연결, 성공 여부를 boolean으로 리턴, 콘솔에 OK,error 출력
		try:
			self.con = pymysql.connect(
				host=self.host,
				port=3306,
				user=self.userId,
				passwd=self.passwd,
				db=self.db_name,
				charset="utf8")
			if self.con != None :
				self.cursor = self.con.cursor()
				print("DB Open : ok")
				return True
		except Exception as e:
			print("DB Open : Error")
			print(e)
			return False
		#==========================================]]

	def DBClose(self) :
		#[[==========================================
		# DB 연결 종료
		self.con.close()
		#==========================================]]

	def RunSQL(self,sql) :
		#[[==========================================
		# SQL 구문을 실행한다. 인서트 업데이트 딜리트
		try :
			self.cursor.execute(sql)
			self.con.commit()
		#	print("RunSQL : ok")
			return True
		except Exception as e :
			print("RunSQL : error")
			print(e)
			return False
		#==========================================]]

	def OpenQuery(self,sql):
		#[[==========================================
		# SQL 구문을 실행한다. 셀렉트
		try :
			self.cursor.execute(sql)
			# 모든 데이터를 읽어온다
			self.data = self.cursor.fetchall()
			# num_fields 컬럼 갯수
			self.num_fields = len(self.cursor.description)
			print("OpenQuery : ok")
			return True
		except Exception as e:
			print("OpenQuery : error")
			print(e)
			return False
		#==========================================]]

	def CloseQuery(self) :
		#[[==========================================
		self.cursor.close()
		#==========================================]]

	def GetTotal(self):
		#[[==========================================
		# 읽어온 데이터의 길이값 반환
		return len(self.data)
		#==========================================]]

	def GetValue(self,index,column_name):
		#[[==========================================
		# 컬럼 이름과 행 번호를 지정하여 값을 불러오는 메소드
		count = -1
		# 커서에서 컬럼 갯수를 읽어온다
		columns = self.cursor.description
		# index를 지정한 행에서 컬럼 이름이 같은것을 찾는다
		for column in columns:
			count += 1
			if column[0] == column_name :
				return self.data[index][count]
		return ""
		#==========================================]]

	def GetList(self,table_name):
		#[[==========================================
		# 테이블에서 모든 정보를 딕셔너리 리스트로 읽어온다
		print("start get value from " + table_name)
		# DB 연결
		self.DBOpen()
		#where 조건이 있을때 처리
		if not self.where :
			self.OpenQuery("select * from " + table_name)
		else :
			if str(type(self.value)) == "<class 'str'>" :
				sql = "select * from " + table_name + " where " + self.where + " LIKE '" + self.value + "'"
			elif str(type(self.value)) == "<class 'int'>" :
				sql = "select * from " + table_name + " where " + self.where + " = " + str(self.value)
			print(sql)
			self.OpenQuery(sql)
			self.clearWhere()
		# SQL 실행
		# 전체 행 갯수 읽어온다
		total_count = self.GetTotal()
		# 리스트 생성
		list = []
		#각 행별로 실행
		for line in range(0,total_count):
			# 딕셔너리 초기화
			dic = {}
			# 각 행의 각 컬럼 별 이름과 값을 읽어온다
			columns = self.cursor.description
			for column in columns:
				column_name = column[0]
				# 딕셔너리에 키 밸류 쌍을 넣는다
				dic[column_name] = self.GetValue(line,column_name)
			# 리스트에 생성된 딕셔너리 넣기
			list.append(dic)
		# 완성된 리스트를 반환
		return list
		#==========================================]]

	def GetDF(self,table_name):
		#[[==========================================
		#테이블에서 자료를 데이터프레임으로 반환한다
		df = DataFrame(self.GetList(table_name))
		return df
		#==========================================]]

	def SetList(self,table_name,list):
		#[[==========================================
		# 리스트의 정보를 테이블에 넣는다
		self.DBOpen()
		print("start set value into " + table_name)
		for dic in list:
			sql  = "insert into " + table_name + " ("
			sql += self.setPreSQL(dic) + ") "
			sql += " values ("
			sql += self.setSQLvalue(dic) +")"
			print(sql)
			self.RunSQL(sql)

	def setPreSQL(self,dic):
		preSQL = ""
		for key in dic.keys():
			if len(preSQL) == 0 :
				preSQL += key
			else :
				preSQL += ", "
				preSQL += key
		return preSQL

	def _R(self,value) :
		#print("_R:" + str(type(value)))
		if str(type(value)) == "<class 'int'>" : 
			return str(value)
		else :
			val = str(value)
			return val.replace("'","''").replace("\\''","''")

	def setSQLvalue(self,dic):
		value = ""
		for key in dic.keys():
			if len(value) == 0 :
				value += "'" + self._R(dic[key]) + "'"
			else :
				value += ", "
				value += "'" + self._R(dic[key]) + "'"
		return value

	def setWhere(self,where,value):
		self.where = where
		self.value = value

	def clearWhere(self):
		self.where = ""

'''
db = DBManager()

print(db._R(1))
print(db._R(1.1))
print(db._R("aa'a"))


사용법 예시
테이블에서 모든 정보를 읽어와 각 행을 컬럼이름:컬럼값의 딕셔너리로 만들고 리스트에 넣어 반환한다.

db = DBManager()
list = db.GetList("recList")
print(list)

'''