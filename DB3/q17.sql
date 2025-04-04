-- 아래는 FOOD 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC FOOD;

-- 음식타입이 Main인 임의의 음식의 가격보다 비싼 음식들을 조회해봅시다.

CREATE TABLE EMPLOYEE(
  employee_id	INT NOT NULL PRIMARY KEY,
  salary		INT NOT NULL,
  position		VARCHAR(10) NOT NULL
);

INSERT INTO EMPLOYEE VALUES
(10000, 9000, '사장'),
(10001, 8000, '부장'),
(10002, 7800, '과장'),
(10003, 7500, '과장'),
(10004, 6800, '대리'),
(10005, 7000, '대리'),
(10006, 6000, '대리'),
(10007, 5500, '사원'),
(10008, 4500, '사원'),
(10009, 7000, '사원');


CREATE TABLE rental.food (
    food_id INT not null PRIMARY KEY,
    food_type VARCHAR(30)not null,
    food_name VARCHAR(100)not null,
    price INT
);


SELECT
    food_id,
    food_type,
    food_name,
    price
FROM
    FOOD
WHERE
    price > ANY (
        SELECT
            price
        FROM
            FOOD
        WHERE
            food_type = 'Main'
    )
ORDER BY
    food_id;

desc food;