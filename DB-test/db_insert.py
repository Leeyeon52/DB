import pymysql
import pandas as pd
import re
from sqlalchemy import create_engine

# CSV 데이터를 DB에 삽입
def insert_to_db(csv_file_path):
    # 💡 여기 있어요! DB 연결 엔진
    engine = create_engine('mysql+pymysql://root:4907@localhost:3306/test')

    try:
        # CSV 읽기
        df = pd.read_csv(csv_file_path, header=0)
        df.columns = [
            'ID', '설립연도', '국가', '분야', '투자단계', '직원 수', '인수여부',
            '상장여부', '고객수(백만명)', '총 투자금(억원)', '연매출(억원)',
            'SNS 팔로워 수(백만명)', '기업가치(백억원)', '성공확률'
        ]

        # DB에 삽입
        df.to_sql('company', con=engine, if_exists='append', index=False)
        print('✅ Data inserted successfully.')

    except Exception as e:
        print("❌ An error occurred:", e)

# 메인 실행
if __name__ == '__main__':
    csv_file = './train.csv'
    insert_to_db(csv_file)
