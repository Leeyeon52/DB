from flask import Flask, request, jsonify
import joblib
import numpy as np
import pandas as pd
import logging
from sqlalchemy import create_engine

# 로그 설정
logging.basicConfig(level=logging.INFO)  # 로그 레벨을 INFO로 설정

engine = create_engine('mysql+pymysql://root:4907@localhost/test')

app = Flask(__name__)


# 학습된 모델 로드
model = joblib.load("malicious_url_model.pkl")  # 저장된 모델 파일

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()  # JSON 데이터 받기
    df = pd.DataFrame([data])
    prediction = model.predict(df)
    return jsonify({'prediction': prediction.tolist()})

@app.route('/insert_db', methods=['POST'])
def insert_db():
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

    try:
        df = pd.DataFrame([data])  # 수정된 부분
        df.to_sql('your_table', con=engine, if_exists='append', index=False) # 데이터베이스 테이블 이름 수정 필요
        logging.info("Data inserted successfully.")
        return jsonify({'message': 'Data inserted successfully.'}), 200

    except Exception as e:
        logging.error(f"An error occurred: {e}")
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)