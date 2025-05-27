import pandas as pd
import pymysql
import joblib
from flask import Flask, request, jsonify
from sqlalchemy import create_enngine, text

app = Flask(__name__)
engine = create_enngine('mysql+pymysql://root:4907@localhost:3306/test')
model = joblib.load('LGBMClassifier.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    prediction = model.predict(data)

    return jsonify({'prediction': prediction.tolist()})

@app.route('/insert_db', methods=['POST'])
def insert_db():
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400

        df = pd.DataFrame(data)
        