"""
작성자 : 함경환
작성일 : 2022년 6월 22일 오전 10시 51분
"""

class recListVO:
    def __init__(self):
        #[[===================================================================
        self.index_no       = 0     # INT         일련번호
        self.get_date       = ""    # DATETIME    수집일자
        self.rec_date       = ""    # DATETIME    공고일자
        self.rec_name       = ""    # VARCHAR     사이트명
        self.com_name       = ""    # VARCHAR     업체명
        self.com_URL        = ""    # TEXT        업체사이트
        self.contents_URL   = ""    # TEXT        주소
        self.content_ori    = ""    # MEDIUMTEXT  내용
        self.career         = 0     # INT         경력
        self.pay            = 0     # INT         급여
        self.count          = 0     # INT         인원
        self.stack_1        = 0     # BOOLEAN     C
        self.stack_2        = 0     # BOOLEAN     C++
        self.stack_3        = 0     # BOOLEAN     C#
        self.stack_4        = 0     # BOOLEAN     JAVA
        self.stack_5        = 0     # BOOLEAN     JS
        self.stack_6        = 0     # BOOLEAN     PYTHON
        self.stack_7        = 0     # BOOLEAN     VB
        self.stack_etc      = ""    # JSON        ETC
        self.List           = []
        #===================================================================]]

    #클래스 변수들을 리스트에 넣는다
    def setList(self):
        #[[===================================================================
        dic = self.getDic()
        self.List.append(dic)
        self.clearVO()
        #===================================================================]]

    def clearVO(self):
        #[[===================================================================
        #클래스 변수들을 리스트에 넣고 클래스 변수를 초기화한다.
        self.index_no       = 0     # INT         일련번호
        self.get_date       = ""    # DATETIME    수집일자
        self.rec_date       = ""    # DATETIME    공고일자
        self.rec_name       = ""    # VARCHAR     사이트명
        self.com_name       = ""    # VARCHAR     업체명
        self.com_URL        = ""    # TEXT        업체사이트
        self.contents_URL   = ""    # TEXT        주소
        self.content_ori    = ""    # MEDIUMTEXT  내용
        self.career         = 0     # INT         경력
        self.pay            = 0     # INT         급여
        self.count          = 0     # INT         인원
        self.stack_1        = 0     # BOOLEAN     C
        self.stack_2        = 0     # BOOLEAN     C++
        self.stack_3        = 0     # BOOLEAN     C#
        self.stack_4        = 0     # BOOLEAN     JAVA
        self.stack_5        = 0     # BOOLEAN     JS
        self.stack_6        = 0     # BOOLEAN     PYTHON
        self.stack_7        = 0     # BOOLEAN     VB
        self.stack_etc      = ""    # JSON        ETC
        #===================================================================]]

    
    #리스트를 반환한다
    def getList(self):
        return self.List

    #Vo의 클래스 변수들과 리스트를 출력한다
    def info(self):
        #[[===================================================================
        print("index_no "       + str(self.index_no))           # INT         일련번호
        print("get_date "       + self.get_date)                # DATETIME    수집일자
        print("rec_date "       + self.rec_date)                # DATETIME    공고일자
        print("rec_name "       + self.rec_name)                # VARCHAR     사이트명
        print("com_name "       + self.com_name)                # VARCHAR     업체명
        print("com_URL "        + self.com_URL)                 # TEXT        업체사이트
        print("contents_URL "   + self.contents_URL)            # TEXT        주소
        print("content_ori "    + self.content_ori)             # MEDIUMTEXT  내용
        print("career "         + str(self.career))             # INT         경력
        print("pay "            + str(self.pay))                # INT         급여
        print("count "          + str(self.count))              # INT         인원
        print("stack_1 "        + str(self.stack_1))            # BOOLEAN     C
        print("stack_2 "        + str(self.stack_2))            # BOOLEAN     C++
        print("stack_3 "        + str(self.stack_3))            # BOOLEAN     C#
        print("stack_4 "        + str(self.stack_4))            # BOOLEAN     JAVA
        print("stack_5 "        + str(self.stack_5))            # BOOLEAN     JS
        print("stack_6 "        + str(self.stack_6))            # BOOLEAN     PYTHON
        print("stack_7 "        + str(self.stack_7))            # BOOLEAN     VB
        print("stack_etc "      + str(self.stack_etc))          # JSON        ETC
        if(len(self.List)>0) :
            print("List :")
            print(self.List)
        #===================================================================]]

    #딕셔너리를 받아 Vo에 넣는다.
    def setDic(self,dic):
        #[[===================================================================
        if "index_no"     in dic : self.index_no     = dic["index_no"]     # INT         일련번호
        if "get_date"     in dic : self.get_date     = dic["get_date"]     # DATETIME    수집일자
        if "rec_date"     in dic : self.rec_date     = dic["rec_date"]     # DATETIME    공고일자
        if "rec_name"     in dic : self.rec_name     = dic["rec_name"]     # VARCHAR     사이트명
        if "com_name"     in dic : self.com_name     = dic["com_name"]     # VARCHAR     업체명
        if "com_URL"      in dic : self.com_URL      = dic["com_URL"]      # TEXT        업체사이트
        if "contents_URL" in dic : self.contents_URL = dic["contents_URL"] # TEXT        주소
        if "content_ori"  in dic : self.content_ori  = dic["content_ori"]  # MEDIUMTEXT  내용
        if "career"       in dic : self.career       = dic["career"]       # INT         경력
        if "pay"          in dic : self.pay          = dic["pay"]          # INT         급여
        if "count"        in dic : self.count        = dic["count"]        # INT         인원
        if "stack_1"      in dic : self.stack_1      = dic["stack_1"]      # BOOLEAN     C
        if "stack_2"      in dic : self.stack_2      = dic["stack_2"]      # BOOLEAN     C++
        if "stack_3"      in dic : self.stack_3      = dic["stack_3"]      # BOOLEAN     C#
        if "stack_4"      in dic : self.stack_4      = dic["stack_4"]      # BOOLEAN     JAVA
        if "stack_5"      in dic : self.stack_5      = dic["stack_5"]      # BOOLEAN     JS
        if "stack_6"      in dic : self.stack_6      = dic["stack_6"]      # BOOLEAN     PYTHON
        if "stack_7"      in dic : self.stack_7      = dic["stack_7"]      # BOOLEAN     VB
        if "stack_etc"    in dic : self.stack_etc    = dic["stack_etc"]    # JSON        ETC
        #===================================================================]]

    def getDic(self):
        #[[===================================================================
        dic = {
            'index_no'      :   self.index_no,                  # INT         일련번호
            'get_date'      :   self.get_date,                  # DATETIME    수집일자
            'rec_date'      :   self.rec_date,                  # DATETIME    공고일자
            'rec_name'      :   self.rec_name,                  # VARCHAR     사이트명
            'com_name'      :   self.com_name,                  # VARCHAR     업체명
            'com_URL'       :   self.com_URL,                   # TEXT        업체사이트
            'contents_RL'   :   self.contents_URL,              # TEXT        주소
            'content_ori'   :   self.content_ori,               # MEDIUMTEXT  내용
            'career'        :   self.career,                    # INT         경력
            'pay'           :   self.pay,                       # INT         급여
            'count'         :   self.count,                     # INT         인원
            'stack_1'       :   self.stack_1,                   # BOOLEAN     C
            'stack_2'       :   self.stack_2,                   # BOOLEAN     C++
            'stack_3'       :   self.stack_3,                   # BOOLEAN     C#
            'stack_4'       :   self.stack_4,                   # BOOLEAN     JAVA
            'stack_5'       :   self.stack_5,                   # BOOLEAN     JS
            'stack_6'       :   self.stack_6,                   # BOOLEAN     PYTHON
            'stack_7'       :   self.stack_7,                   # BOOLEAN     VB
            'stack_etc'     :   self.stack_etc                  # JSON        ETC
            }
        return dic
        #===================================================================]]

    def setValue(self,key,value):
        self.setDic({key:value})


'''[[===============================================================================

#사용법

#객체 생성
vo = recListVO()

#키와 값을 성장
vo.setValue("pay",1000)
vo.setValue("com_name","이젠")
vo.setValue("stack_1",1)
vo.setValue("stack_2",1)

vo.setList()
    #셋팅한 값들을 리스트로 변환한다
    #클래스 변수를 리스트로 변환하면 클래스 변수들이 초기화 됩니다.

#출력해본다
vo.info()
    #Vo 클래스 안의 리스트가 있으면 리스트 내용이 출력됩니다.

#VO의 리스트를 받아서 출력해봅니다.
print(vo.getList())

===============================================================================]]'''