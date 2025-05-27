import pandas as pd
from sqlalchemy import create_engine  # ← 이게 빠져 있었어요!

def get_success_by_field(field_name):
    engine = create_engine('mysql+pymysql://root:4907@localhost:3306/test')
    try:
        query = f"SELECT ID, 성공확률 FROM company WHERE 분야 = '{field_name}'"
        df = pd.read_sql(query, con=engine)

        if df.empty:
            print(f"❌ '{field_name}' 분야에 해당하는 기업이 없습니다.")
        else:
            print(f"✅ '{field_name}' 분야의 성공확률 목록:")
            print(df)

    except Exception as e:
        print("❌ 오류 발생:", e)

# 실행 부분
if __name__ == '__main__':
    field = input("조회할 분야명을 입력하세요 (예: 핀테크, 게임, AI 등): ")
    get_success_by_field(field)
