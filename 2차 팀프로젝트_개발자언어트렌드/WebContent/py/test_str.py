import re
from xml.sax import default_parser_list
from numpy import str_
import word_list as wl

str_list = [
	"C", "C++", "C#",							#원 형태
	"C의" , "C언어", "c =",						#인식해야 하는 단어
	"CRM", "CSS", "co", "C-lab" , "c=lab",		#인식하면 안되는 단어
	"JAVA" ,
	"자바" ,
	"Java Script",
	"JAVA_SCRIPT", "JAVASCRIPT", "자바스크립트", "자바 스크립트",
	"JSP" 
	]

stack_etc_list = []
stack_dic	= {
		'stack_1'	: 0,		#'C'
		'stack_2'	: 0,		#'C++'
		'stack_3'	: 0,		#'C#'
		'stack_4'	: 0,		#'Java'
		'stack_5'	: 0,		#'JavaScript'
		'stack_6'	: 0,		#'Python'
		'stack_7'	: 0			#'VB'
	}



print("원본 리스트"+"="*50)
print(str_list)



str_data = ""
for item in str_list :
	str_data += item + ", "
#print(str_data)

str_data = str_data.upper()
print("UPPER"+"="*50)
print(str_data)



result = []
for dic_key, dic_value in wl.word_like.items():
	if str(type(dic_value)) == "<class 'list'>" :
		for value_item in dic_value :
			# print("replace")
			# print("key :" + dic_key)
			# print("value :" + value_item)
			str_data = str_data.replace(value_item, dic_key)
			# print(str_data)
	else :
		# print("replace")
		# print("key :" + dic_key)
		# print("value :" + dic_value)
		str_data = str_data.replace(dic_value, dic_key)
		# print(str_data)

print("word_like"+"="*50)
print(str_data)



data_list = str_data.split(",")
print("split "+"="*50)
print(data_list)



new_stack_dic = {
	'C'				: 0,
	'C++'			: 0,
	'C#'			: 0,
	'JAVA'			: 0,
	'JS_'	: 0,
	'Python'		: 0,
	'VB'			: 0
	}
for item in data_list :
	re_c	 = re.compile('C[\+\#\-\=A-Z]')
	item = item.strip()
	flag = 0
	for key in new_stack_dic.keys():
		if key == 'C' :
			if item.startswith("C") and not re_c.match(item) :
				new_stack_dic['C'] += 1
				print('C count')
				print("item :" + item)
				
				flag = 1
		elif item.startswith(key) :
			new_stack_dic[key] += 1
			print(key + ' count')
			print("item :" + item)
			
			flag = 1
	if flag == 0 :
		stack_etc_list.append(item)

print('new_stack_dic')
print(new_stack_dic)

print('stack_etc_list')
print(stack_etc_list)


'''for index in str_list:
	if index.startswith("C++"):
		print(index)
print("="*50)
for index in str_list:
	if index.startswith("C#"):
		print(index)
print("="*50)'''

'''for index in str_list:
	if index.startswith("C") and not p.match(index) :
		print(index)
print("="*50)'''
