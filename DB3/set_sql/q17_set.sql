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
    food_id INT PRIMARY KEY,
    food_type VARCHAR(20),
    food_name VARCHAR(50),
    price INT
);



INSERT INTO rental.food VALUES
(1, 'Main', 'Pizza', 15000),
(2, 'Side', 'Salad', 8000),
(3, 'Main', 'Pasta', 12000),
(4, 'Dessert', 'Cake', 5000),
(5, 'Main', 'Burger', 10000);


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