import pymysql
from sqlalchemy import create_engine
import pandas as pd

def getdata_from_db(query):
    # 데이터베이스 연결
    try:
        engine = create_engine('mysql+pymysql://root:1436@192.168.0.187:3306/test')
        # SQL 쿼리를 실행하고 DataFrame으로 가져오기
        df = pd.read_sql(query, engine)
        return df
        
    except Exception as e:
        print("An error occurred while getting data:", e)
        return None

def main():
    query = 'SELECT * FROM test.member'
    df = getdata_from_db(query)
    
    if df is not None:
        print(df)
        print(f"Number of records: {len(df)}")

if __name__ == '__main__':
    main()