-- customer 테이블을 정의하세요.

-- kickboard 테이블을 정의하세요.

-- 정의한 두 테이블을 확인하는 코드입니다. 아래 주석을 해제하여 결과를 확인하세요.
DESC customer;
DESC kickboard;

-- 정의한 테이블에 데이터가 올바르게 삽입되는지 확인해보세요.
-- INSERT INTO customer
-- VALUES('0187642351', '김민준', 'kmax6', 'HASH-lui235dfi2', '08786173448', '1989-03-09');
-- INSERT INTO kickboard
-- VALUES('7YWC', 'boardkick', 2015, 100, 1000, 'elice');


CREATE TABLE customer (
    phone_number VARCHAR(11) PRIMARY KEY,
    name VARCHAR(16) NOT NULL,
    member_id VARCHAR(16) UNIQUE,
    password VARCHAR(20) NOT NULL,
    emergency_number VARCHAR(11),
    birthday DATE
);


CREATE TABLE kickboard (
    id VARCHAR(16) PRIMARY KEY,
    brand VARCHAR(16) NOT NULL,
    manufactured_year INT,
    mileage INT,
    price INT DEFAULT 1000,
    location VARCHAR(32)
);