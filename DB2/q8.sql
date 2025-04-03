-- UPDATE문을 이용해 쿼리를 작성해 보세요.


-- 값을 잘 수정했는지 확인하는 코드입니다. 수정하지마세요!
SELECT * FROM employees;


CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    superior_no INT                     ,
    PRIMARY KEY (emp_no)
);

ALTER TABLE employees ADD FOREIGN KEY (superior_no) REFERENCES employees(emp_no);

INSERT INTO employees VALUES
(10001,'1953-09-02','Georgi','Facello','M','1986-06-26', NULL),
(10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21', NULL),
(10003,'1959-12-03','Parto','Bamford','M','1986-08-28', NULL),
(10004,'1954-05-01','Chirstian','Koblick','M','1986-12-01', NULL),
(10005,'1955-01-21','Kyoichi','Maliniak','M','1989-09-12', 10001),
(10006,'1953-04-20','Anneke','Preusig','F','1989-06-02', 10002),
(10007,'1957-05-23','Tzvetan','Zielinski','F','1989-02-10', 10002),
(10008,'1958-02-19','Saniya','Kalloufi','M','1994-09-15', NULL),
(10009,'1952-04-19','Sumant','Peac','F','1985-02-18', NULL),
(10010,'1963-06-01','Duangkaew','Piveteau','F','1989-08-24', 10001);

update employeess
set birth_date = '1953-09-01'
where emp_no = 10001;

SELECT * FROM employees WHERE emp_no = 10001;
