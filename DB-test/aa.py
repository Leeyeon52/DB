from flask import Flask, request, jsonify
import pandas as pd
from sqlalchemy import create_engine

app = Flask(__name__)

# MySQL 연결 설정
DB_USER = "root"
DB_PASSWORD = "4907"
DB_HOST = "localhost"
DB_PORT = "3306"
DB_NAME = "test"

engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}")

# 데이터 조회 API
@app.route('/data', methods=['GET'])
def get_data():
    try:
        query = "SELECT * FROM company;"
        df = pd.read_sql(query, con=engine)
        return jsonify(df.to_dict(orient="records"))
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# 데이터 삽입 API (CSV 업로드)
@app.route('/upload', methods=['POST'])
def upload_csv():
    if 'file' not in request.files:
        return jsonify({"error": "파일이 없습니다!"}), 400

    file = request.files['file']
    
    try:
        df = pd.read_csv(file)
        df.to_sql('company', con=engine, if_exists='append', index=False)
        return jsonify({"message": "✅ 데이터가 성공적으로 삽입되었습니다!"}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
