import pandas as pd
import pymysql
import joblib
from flask import Flask, request, jsonify
from sqlalchemy import create_engine, text

app = Flask(__name__)
engine = create_engine('mysql+pymysql://root:4907@localhost:3306/test')
model = joblib.load('LGBMClassifier.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        if not data:
            return jsonify({'error': 'No data provided'}), 400
        df = pd.DataFrame([data]) #수정된 부분
        prediction = model.predict(df)

        return jsonify({'prediction': prediction.tolist()})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/insert_db', methods=['POST'])
def insert_db():
    try:
        data = request.get_json()
        if not data:
            return jsonify({'error': 'No data provided'}), 400

        df = pd.DataFrame([data]) #수정된 부분
        table_name = 'predictions' # 테이블 이름을 명시적으로 지정
        df.to_sql(table_name, con=engine, if_exists='append', index=False)

        return jsonify({'message': 'Data inserted successfully'})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)