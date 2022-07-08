import DBManager as DB

db = DB.DBManager()
db.setWhere(where='comu_name',where_value='kldp' )
list = db.GetList('comu_stack_sum_year')
result = []
comu_name_list = []

comu_name_list = ['C','C++','C#','JAVA','JS','PYTHON','VB']

for item in comu_name_list:
    result.append({'name': item,'data': []})

for dic in list:
    for name in comu_name_list:
        date  = 'Date.UTC(' + str(dic['comu_date']) + ')'
        count = int(dic[name])
        data  = [date,count]
        for item in result:
            if item['name'] == name and dic[name] != 0 :
#                print("item['name']" + item['name'])
#                print("dic['comu_name']" + name)
#                print('append')
                item['data'].append(data)
print(result)

            
    
'''
for dic in list:
    if count == 0 :
        name  = dic['comu_name']
        date  = 'Date.UTC(' + str(dic['comu_date']) + ')'
        count = dic['count']
        data  = [date,count]
        result.append({'name': name,'data': [data]})
    else :
        for item in result :
            if item['name'] == dic['comu_name']:
                date  = 'Date.UTC(' + str(dic['comu_date']) + ')'
                count = dic['count']
                data  = [date,count]
                item['data'].append(data)
            else :
                name  = dic['comu_name']
                date  = 'Date.UTC(' + str(dic['comu_date']) + ')'
                count = dic['count']
                data  = [date,count]
                result.append({'name': name,'data': [data]})
print(result)
'''