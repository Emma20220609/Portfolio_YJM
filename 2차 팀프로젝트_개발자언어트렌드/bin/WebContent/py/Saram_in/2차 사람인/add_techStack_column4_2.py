# TechStack을 읽기 위한 파일

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
                # ↓ beautiful soup으로 태그르 제거하지 않은 상태이기 때문에 title2에 upper, replace 등을 사용할 수 없다. 즉 오류가 남. 
                # title3 = title2.upper().replace("JAVASCRIPT", "JS_").replace("JAVA SCRIPT", "JS_").replace("JAVA_SCRIPT", "JS_").replace("OBJECTIVE-C", "objective씨")
                # 따라서 오직 처리를 거지고 나온 info3만 사용이 가능함.

                info3 = c_info1.upper().replace("JAVASCRIPT", "JS_").replace("JAVA SCRIPT", "JS_").replace("JAVA_SCRIPT", "JS_").replace("OBJECTIVE-C", "objective씨")
                # ======== C# ============
                if 'C#' in info3:
                    count_cs += 1
        
                # ======== C++ ============
                if 'C++' in info3:
                    count_cpp += 1
        
                # ======== Java ============
                if 'JAVA' in info3:
                    count_java += 1
                elif '자바' in info3:
                    count_java += 1
        
                # ======== PYTHON ============
                if 'PYTHON' in info3:
                    count_Python += 1
                elif '파이썬' in info3:
                    count_Python += 1
        
                # ======== JavaScript ============
                if 'JS_' in info3:
                    count_js += 1
                elif '자바스크립트' in info3:
                    count_js += 1
        
                # ======== C language ============
                if 'C,' in info3 :
                    count_c += 1
                elif 'C/' in info3 :
                    count_c += 1
                
                # ======== 비주얼 베이직 ============
                if 'VB' in info3:
                    count_vb6 += 1
        
                # ======== 비주얼 베이직 닷넷 ============
                if 'VB.NET' in info3:
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
