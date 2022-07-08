import DBManager as DB
import recListVO as rVO

#객체 생성
db = DB.DBManager()
VO = rVO.recListVO()


# recList 테이블의 모든 정보를 리스트로 받아옴
db.setWhere("index_no", 2)
lists = db.GetList("recList")
print(lists)

# 리스트를 VO 객체에 넣음
'''
for dic in list:
    VO.setDic(dic)
    VO.setList()

VO.info()
'''

# recList 테이블에 자료를 넣는다
'''
dic = { "com_name" : "이젠", "pay" : 1000}
list =[]
list.append(dic)

db.SetList("recList",list)
'''

# community 테이블에 자료를 넣고 읽어온다
'''
dic = { "comu_name" : "이젠", "stack_etc" : { "stack" : ["C", "JSP", "PHP"]}}
list =[]
list.append(dic)
db.SetList("community",list)

list = db.GetList("community")
print(list)
'''