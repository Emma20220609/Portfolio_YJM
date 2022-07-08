"""
작성자 : 함경환
작성일 : 2022년 6월 22일 오전 10시 51분
"""

import DBManager as DB

class recListDTO :

    def SetList(self,table_name,list):
        #[[==========================================
        # 리스트의 정보를 테이블에 넣는다
        self.DBOpen()
        print("start set value into " + table_name)
        for dic in list:
            sql  = "insert into " + table_name + " ("
            sql += self.setPreSQL(dic) + ") "
            sql += " values ('"
            sql += self.setSQLvalue(dic)
            print(sql)
            self.RunSQL(sql)

    def setPreSQL(self,dic):
        list = []
        if "index_no"     in dic : list.append("index_no")
        if "get_date"     in dic : list.append("get_date")
        if "rec_date"     in dic : list.append("rec_date")
        if "rec_name"     in dic : list.append("rec_name")
        if "com_name"     in dic : list.append("com_name")
        if "com_URL"      in dic : list.append("com_URL")
        if "contents_URL" in dic : list.append("contents_URL")
        if "content_ori"  in dic : list.append("content_ori")
        if "career"       in dic : list.append("career")
        if "pay"          in dic : list.append("pay")
        if "count"        in dic : list.append("count")
        if "stack_1"      in dic : list.append("stack_1")
        if "stack_2"      in dic : list.append("stack_2")
        if "stack_3"      in dic : list.append("stack_3")
        if "stack_4"      in dic : list.append("stack_4")
        if "stack_5"      in dic : list.append("stack_5")
        if "stack_6"      in dic : list.append("stack_6")
        if "stack_7"      in dic : list.append("stack_7")
        if "stack_etc"    in dic : list.append("stack_etc")
        preSQL = ""
        for item in list:
            if len(preSQL) == 0 :
                preSQL += item
            preSQL += ", "
            preSQL += item
        return preSQL

    def setSQLvalue(self,dic):
        list = []
        if "index_no"     in dic : list.append(dic["index_no"])
        if "get_date"     in dic : list.append(dic["get_date"])
        if "rec_date"     in dic : list.append(dic["rec_date"])
        if "rec_name"     in dic : list.append(dic["rec_name"])
        if "com_name"     in dic : list.append(dic["com_name"])
        if "com_URL"      in dic : list.append(dic["com_URL"])
        if "contents_URL" in dic : list.append(dic["contents_URL"])
        if "content_ori"  in dic : list.append(dic["content_ori"])
        if "career"       in dic : list.append(dic["career"])
        if "pay"          in dic : list.append(dic["pay"])
        if "count"        in dic : list.append(dic["count"])
        if "stack_1"      in dic : list.append(dic["stack_1"])
        if "stack_2"      in dic : list.append(dic["stack_2"])
        if "stack_3"      in dic : list.append(dic["stack_3"])
        if "stack_4"      in dic : list.append(dic["stack_4"])
        if "stack_5"      in dic : list.append(dic["stack_5"])
        if "stack_6"      in dic : list.append(dic["stack_6"])
        if "stack_7"      in dic : list.append(dic["stack_7"])
        if "stack_etc"    in dic : list.append(dic["stack_etc"])
        value = ""
        for item in list:
            if len(value) == 0 :
                value += item
            value += ", "
            value += item
        return value


'''
사용법 예시
테이블에서 모든 정보를 읽어와 각 행을 컬럼이름:컬럼값의 딕셔너리로 만들고 리스트에 넣어 반환한다.

db = DBManager()
list = db.GetList("recList")
print(list)

'''