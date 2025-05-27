import requests
import pandas as pd
import time

df = pd.read_csv('./over.csv', header=0)
df.drop(columns=['Unnamed: 0'], axis=1 inplace=True)


url = 'http://127.0.01:9999/insert_db'

cnt_ok = 0
cnt_frand = 0
s_time = time.time()
fraud_index=[]

for index, row in df.iterrows():
    input_data = row.to_dict()
    
    try:
        time.sleep(1)
        res = requests.post(url, json=input_data)

        if res.status_code == 200:
            print('requests:',res.json())
            prediction = res.json().get('prediction')
            for p in 