import DBManager as DB

db = DB.DBManager()
list = db.GetList('comu_total_year')
result = []
comu_name_list = []

#comu_name의 종류를 뽑아낸다
for dic in list:
    if dic['comu_name'] not in comu_name_list :
        comu_name_list.append(dic['comu_name'])
#print(comu_name_list)

for item in comu_name_list:
    result.append({'name': item,'data': []})
#print(result)

for dic in list:
    name  = dic['comu_name']
    date  = 'Date.UTC(' + str(dic['comu_date']) + ')'
    count = dic['count']
    data  = [date,count]
    for item in result:
        if item['name'] == name :
#            print("item['name']" + item['name'])
#           print("dic['comu_name']" + name)
            print('append')
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