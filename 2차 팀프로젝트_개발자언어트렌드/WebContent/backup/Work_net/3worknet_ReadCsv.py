from pandas import DataFrame, Series
import pandas as pd
import csv

f = open(r'D:\\CTEAM\\2nd Project\\park\\220622\\2. 워크넷_url, 실제파일, 분석자료_0620\\2worknet_info.csv', encoding='utf8') #디폴트 인코딩 cp949
r = csv.reader(f)
# print(r)

def ReadCsv() :
    count_c = 0
    count_cs = 0
    count_cpp = 0
    count_java = 0
    count_Python = 0
    count_js = 0
    count_vb6 = 0
    count_vb = 0

    for row in r:
        # print(row[1],"\n")
        # print(row[2], "★★★★★★\n\n")
        row[1] = row[1].upper().replace("JAVASCRIPT", "JS_").replace("JAVA SCRIPT", "JS_").replace("JAVA_SCRIPT", "JS_")
        row[2] = row[2].upper().replace("JAVASCRIPT", "JS_").replace("JAVA SCRIPT", "JS_").replace("JAVA_SCRIPT", "JS_").replace("OBJECTIVE-C", "objective씨")


        # ======== C# ============
        if 'C#' in row[1]:
            count_cs += 1
        elif 'C#' in row[2]:
            count_cs += 1

        # ======== C++ ============
        if 'C++' in row[1]:
            count_cpp += 1
        elif 'C++' in row[2]:
            count_cpp += 1

        # ======== Java ============
        if 'JAVA' in row[1]:
            count_java += 1
        elif '자바' in row[1]:
            count_java += 1
        elif 'JAVA' in row[2]:
            count_java += 1
        elif '자바' in row[2]:
            count_java += 1

        # ======== PYTHON ============
        if 'PYTHON' in row[1]:
            count_Python += 1
        elif '파이썬' in row[1]:
            count_Python += 1
        elif 'PYTHON' in row[2]:
            count_Python += 1
        elif '파이썬' in row[2]:
            count_Python += 1

        # ======== JavaScript ============
        if 'JS_' in row[1]:
            count_js += 1
        elif '자바스크립트' in row[1]:
            count_js += 1

        elif 'JS_' in row[2]:
            count_js += 1
        elif '자바스크립트' in row[2]:
            count_js += 1

        # ======== C language ============
        if 'C' in row[1] :
            count_c += 1
        elif 'C' in row[2] :
            count_c += 1


        # ======== 비주얼 베이직 ============
        if 'VB' in row[1]:
            count_vb6 += 1
        elif 'VB' in row[2]:
            count_vb6 += 1

        # ======== 비주얼 베이직 닷넷 ============
        if 'VB.NET' in row[1]:
            count_vb += 1
        elif 'VB.NET' in row[2]:
            count_vb += 1

    count_c = count_c - (count_cs + count_cpp)
    print("C = ", count_c)
    print("C# = ", count_cs)
    print("C++ = ", count_cpp)
    print("Java = ", count_java)
    print("Python = ", count_Python)
    print("JavaScript = ", count_js)
    print("Vb6 = ", count_vb6)
    print("Vb.net = ", count_vb)

ReadCsv()



# if target in list:
#     print("리스트 안에 " + target + "이 있습니다.")
# else :
#     print("리스트 안에 " + target + "이 없습니다.")


# strdata = "asd#asdfasldjkfalsjkdf"

# for item in list:
#     if (item.find(target)<0):
#         print("리스트 안에 " + target + "이 없습니다.")
#     else :
#         print("리스트 안에 " + target + "이 있습니다.")
# print(strdata.find("1"))


# if cs == 0 :
#     cs += 1
# else cs <= 1 :
#     cs = 0
#     return
