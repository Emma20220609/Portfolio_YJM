str_data = "[<stack>.NET</stack>, <stack>ASP.NET</stack>, <stack>C#</stack>, <stack>Java</stack>, <stack>SQL</stack>, <stack>Oracle</stack>, <stack>MySQL</stack>, <stack>SW</stack>]"
str_data = "[<stack>.NET</stack>, <stack>C#</stack>, <stack>C++</stack>, <stack>AZURE</stack>, <stack>Unity</stack>, <stack>Unreal Engine</stack>, <stack>AR</stack>, <stack>VR</stack>, <stack>Windows</stack>, <stack>Visual Studio</stack>]"

class test :
	stack_dic = {
		'stack_1'	: 0,		#'C'
		'stack_2'	: 0,		#'C++'
		'stack_3'	: 0,		#'C#'
		'stack_4'	: 0,		#'Java'
		'stack_5'	: 0,		#'JavaScript'
		'stack_6'	: 0,		#'Python'
		'stack_7'	: 0			#'VB'
	}
	def set_pre(self,str_content):
		result = []
		str_content	= str_content.upper()
		str_content	= str_content.replace("[", "")
		str_content	= str_content.replace("]", "")
		str_content	= str_content.replace(" ", "")
		str_content	= str_content.replace("'", "")
		str_content	= str_content.replace("<STACK>", "")
		str_content	= str_content.replace("</STACK>", "")
		result 		= str_content.split(",")
		return result

	def count(self,list):
		stack_etc_list = []
		while list :
			item = list.pop()
			if item.startswith('C_') :
				self.stack_dic['stack_1'] = 1
			elif item.startswith('C++') :
				self.stack_dic['stack_2'] = 1
			elif item.startswith('C#') :
				self.stack_dic['stack_3'] = 1
			elif item.startswith('JAVA') :
				self.stack_dic['stack_4'] = 1
			elif item.startswith('JS_') :
				self.stack_dic['stack_5'] = 1
			elif item.startswith('PYTHON') :
				self.stack_dic['stack_6'] = 1
			elif item.startswith('VB') :
				self.stack_dic['stack_7'] = 1
			else :
				stack_etc_list.append(item)
		return stack_etc_list

'''		for item in list :
			if item.startswith('C_') :
				self.stack_dic['stack_1'] = 1
			elif item.startswith('C++') :
				self.stack_dic['stack_2'] = 1
			elif item.startswith('C#') :
				self.stack_dic['stack_3'] = 1
			elif item.startswith('JAVA') :
				self.stack_dic['stack_4'] = 1
			elif item.startswith('JS_') :
				self.stack_dic['stack_5'] = 1
			elif item.startswith('PYTHON') :
				self.stack_dic['stack_6'] = 1
			elif item.startswith('VB') :
				self.stack_dic['stack_7'] = 1
			else :
				stack_etc_list.append(item)
		return stack_etc_list'''

test = test()
result = test.set_pre(str_data)
result = test.count(result)
print(result)
print(test.stack_dic)