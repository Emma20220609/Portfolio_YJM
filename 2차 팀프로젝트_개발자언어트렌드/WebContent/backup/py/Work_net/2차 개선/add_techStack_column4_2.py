from pandas import DataFrame, Series
import pandas as pd
import csv

list = []

class ReadStack :
    def ReadCsv(title1, c_info1) :
        count_c = 0
        count_cs = 0
        count_cpp = 0
        count_java = 0
        count_Python = 0
        count_js = 0
        count_vb6 = 0
        count_vb = 0
    
        data = []
        for title2 in title1 :
                title3 = title2.upper().replace("JAVASCRIPT", "JS_").replace("JAVA SCRIPT", "JS_").replace("JAVA_SCRIPT", "JS_")
                info3 = c_info1.upper().replace("JAVASCRIPT", "JS_").replace("JAVA SCRIPT", "JS_").replace("JAVA_SCRIPT", "JS_").replace("OBJECTIVE-C", "objective씨")
                # print(title1,"\n")
                # print(info2, "★★★★★★\n\n")
                # ======== C# ============
                if 'C#' in title3:
                    count_cs += 1
                elif 'C#' in info3:
                    count_cs += 1
        
                # ======== C++ ============
                if 'C++' in title3:
                    count_cpp += 1
                elif 'C++' in info3:
                    count_cpp += 1
        
                # ======== Java ============
                if 'JAVA' in title3:
                    count_java += 1
                elif '자바' in title3:
                    count_java += 1
                    
                elif 'JAVA' in info3:
                    count_java += 1
                elif '자바' in info3:
                    count_java += 1
        
                # ======== PYTHON ============
                if 'PYTHON' in title3:
                    count_Python += 1
                elif '파이썬' in title3:
                    count_Python += 1
                    
                elif 'PYTHON' in info3:
                    count_Python += 1
                elif '파이썬' in info3:
                    count_Python += 1
        
                # ======== JavaScript ============
                if 'JS_' in title3:
                    count_js += 1
                elif '자바스크립트' in title1:
                    count_js += 1
        
                elif 'JS_' in info3:
                    count_js += 1
                elif '자바스크립트' in info3:
                    count_js += 1
        
                # ======== C language ============
                if 'C,' in title3 :
                    count_c += 1
                elif 'C,' in info3 :
                    count_c += 1
                elif 'C/' in title3 :
                    count_c += 1
                elif 'C/' in info3 :
                    count_c += 1
                
                # ======== 비주얼 베이직 ============
                if 'VB' in title3:
                    count_vb6 += 1
                elif 'VB' in info3:
                    count_vb6 += 1
        
                # ======== 비주얼 베이직 닷넷 ============
                if 'VB.NET' in title3:
                    count_vb += 1
                elif 'VB.NET' in info3:
                    count_vb += 1
                    
                # ===========data list에 넣는곳===========
                if count_c > 0 :
                    data.append("C") 
                    count_c = 0
                if count_cs > 0 :
                    data.append("C#") 
                    count_cs = 0
                if count_cpp > 0 :
                    data.append("C++") 
                    count_cpp = 0
                if count_java > 0 :
                    data.append("JAVA") 
                    count_java = 0
                if count_Python > 0 :
                    data.append("PYTHON") 
                    count_Python = 0
                if count_js > 0 :
                    data.append("JAVASCRIPT") 
                    count_js = 0
                if count_vb > 0 :
                    data.append("VB") 
                    count_vb = 0
                if count_vb6 > 0 :
                    data.append("VB6") 
                    count_vb6 = 0
        return data
    





# ↓ 참고 자료
#     count_c = count_c - (count_cs + count_cpp)
#     print("C = ", count_c)
#     print("C# = ", count_cs)
#     print("C++ = ", count_cpp)
#     print("Java = ", count_java)
#     print("Python = ", count_Python)
#     print("JavaScript = ", count_js)
#     print("Vb6 = ", count_vb6)
#     print("Vb.net = ", count_vb)
# ReadCsv()


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
