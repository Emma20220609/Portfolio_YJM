import requests
import json
from pandas import DataFrame, Series

def send_api(path, method):
    API_HOST = " https://api.github.com"
    url = API_HOST + path
    headers = {'Content-Type': 'application/json', 'charset': 'UTF-8', 'Accept': 'application/vnd.github.v3+json'}
    body = { }

    try:
        if method == 'GET':
            response = requests.get(url, headers=headers)
        elif method == 'POST':
            response = requests.post(url, headers=headers, data=json.dumps(body, ensure_ascii=False, indent="\t"))
        #print("response status %r" % response.status_code)
        #print(response.text)
        data = json.loads(response.text)
        list=[]
        for i in range(0,len(data)) :
            list.append(data[i]["full_name"])
            #print(list)

        df = DataFrame(list)
        #csv 파일로 저장한다.
        filename = 'D:\\CTEAM\\2nd Project\\MOON\\github.csv'
        df.to_csv(filename, encoding="utf-8-sig", index=False)

    except Exception as ex:
        print(ex)

send_api("/repositories", "GET")