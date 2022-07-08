from pandas import DataFrame
import DBManager as DB
import recListVO as rVO

#객체 생성
db = DB.DBManager()
VO = rVO.recListVO()

where = "com_name"
value = "누리봄"
where = "index_no"
value = 110
print(type(value))
db.setWhere(where, value)
list = db.GetList("recList")
#select * from recList where com_name = '누리봄';
print(list)

'''
# 딕셔너리를 리스트로 만들어 데이터프레임에 넣는 과정
list_ori = []
dic_ori = { "comu_name" : "이젠", "stack_etc" : { "stack" : ["C", "JSP", "PHP"]}}
list_ori.append(dic_ori)
dic_ori = { "comu_name" : "그젠", "stack_etc" : { "stack" : ["JS", "C#"]}}
list_ori.append(dic_ori)
df_ori = DataFrame(list_ori)

# 데이터 프레임을 리스트로 변환하기 : 딕셔너리를 거쳐 리스트로 변환하는 방법
dic_from_df = df_ori.to_dict()
list_from_df = df_ori.columns.values.tolist() + df_ori.values.tolist()
# 결과가 좋지 않음 
print(list_from_df)

# 
list_from_df = []
for row, columns in df_ori.iterrows():
    line = df_ori.iloc[row]
    tmp = line.to_dict()
    list_from_df.append(tmp)

print("\n 원본 리스트")
print(list_ori)
print("\n 데이터 프레임에서 얻어낸 리스트")
print(list_from_df)

print("딕셔너리 : =======================================================================")
print(dic_ori)
print("\n리스트 : =======================================================================")
print(list_ori)
print("\n데이터프레임 : =======================================================================")
print(df_ori)
print("\ndf -> dic : =======================================================================")
print(dic_from_df)
print("\ndf -> list : =======================================================================")
print(list_from_df)
'''

'''
# recList 테이블의 모든 정보를 리스트로 받아옴
db.setWhere("index_no", 10)
lists = db.GetList("recList")
print(lists)

db.setWhere("index_no", 10)
df = db.GetDF("recList")
print(df)
for row, columns in df.iterrows():
    print("데이터프레임 출력 ======================================")
    print(columns)
    print("데이터프레임 출력 ======================================")

dic = df.to_dict()
print(dic)

list = df.columns.values.tolist() + df.values.tolist()
for item in list:
    print("리스트 출력 ======================================")
    print(item)

# 리스트를 VO 객체에 넣음
for dic in list:
    VO.setDic(dic)
    VO.setList()

VO.info()

# recList 테이블에 자료를 넣는다

dic = { "com_name" : "이젠", "pay" : 1000}
list =[]
list.append(dic)

db.SetList("recList",list)

# community 테이블에 자료를 넣고 읽어온다

dic = { "comu_name" : "이젠", "stack_etc" : { "stack" : ["C", "JSP", "PHP"]}}
list =[]
list.append(dic)
db.SetList("community",list)

list = db.GetList("community")
print(list)
'''