import pymysql
import pandas as pd
import time
from sqlalchemy import create_engine

# DB 연결
def get_engine():
    return create_engine('mysql+pymysql://root:4907@localhost:3306/test')

# submission.csv를 DB에 삽입
def insert_submission_to_db(csv_file_path):
    engine = get_engine()
    try:
        df = pd.read_csv(csv_file_path, header=0)
        df.columns = ['ID', '성공확률']
        df.to_sql('submission', con=engine, if_exists='append', index=False)
        print('✅ submission.csv 데이터 삽입 완료')
    except Exception as e:
        print("❌ 삽입 오류:", e)

# 성공확률이 1인 데이터만 실시간으로 조회
def fetch_success_real_time(interval_sec=5):
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='4907',
        database='test',
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor
    )

    try:
        print("🟢 실시간 성공확률 1 조회 시작 (Ctrl+C로 중지)")
        while True:
            with connection.cursor() as cursor:
                query = """
                    SELECT * FROM submission
                    WHERE ROUND(성공확률, 3) = 1.000
                    ORDER BY ID DESC
                """
                cursor.execute(query)
                result = cursor.fetchall()

                print('✅ 성공한 데이터:')
                for row in result:
                    print(row)

            print("⏳ 대기 중...\n")
            time.sleep(interval_sec)

    except KeyboardInterrupt:
        print("🛑 실시간 조회 중단됨 (사용자 종료).")

    except Exception as e:
        print("❌ 조회 오류:", e)

    finally:
        connection.close()

# 실행
if __name__ == '__main__':
    csv_file = './submission.csv'

    # 1단계: CSV 데이터 삽입
    insert_submission_to_db(csv_file)

    # 2단계: 실시간 성공확률 == 1 조회
    fetch_success_real_time(interval_sec=5)
