import DBManager as DB
from bs4 import BeautifulSoup
from stack_count import ReadStack

class comuAnalysis:
	def getValue(self,dic,key):
		str_content = dic[key]
		soup = BeautifulSoup(str_content, "html.parser")
		for s in soup.select('script'):
			s.extract()
		for s in soup.select('style'):
			s.extract()
		return soup.text

	def main(self, parse_data_table_name, key, value, target) :
		db = DB.DBManager()
		# where 설정
		db.setWhere(key, value)
		# 원본 데이터가 있는 테이블 이름을 파라메터로 받아서 GetList()로 받아온다
		list = db.GetList(parse_data_table_name)
		count = -1
		datalist = []
		for dic in list :
			count += 1
			# 데이터 중에 컬럼이름이 "contents" 인것을 가져온다
			str_content = self.getValue(dic,"contents")
			# 데이터를 전처리 한다. bs4객체 -> 문자 리스트
			content = self.set_pre(str_content)
			# 문자열 리스틀 stack cheack 한다
			stack_etc = self.cheack_stack(content)
			print(self.stack_dic)
			print(stack_etc)
			if count > 2 :
				break


#			데이터를 target 이름의 테이블에 넣는다.
#			db.SetList(target,datalist)

# 생성자
comu = comuAnalysis()
# 원본 테이블 이름, 컬럼 이름, 찾을 값, 데이터 넣을 테이블 이름
comu.main("comuList","comu_name","devsnote_w","comuAnalysis")