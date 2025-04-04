-- 아래는 EMPLOYEE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC EMPLOYEE;

-- 급여가 8000미만인 직원의 관리자 아이디와 급여를 출력하는 쿼리를 작성하세요.

CREATE TABLE EMPLOYEE(
  employee_id	INT NOT NULL PRIMARY KEY,
  manager_id	INT,
  salary		INT NOT NULL
);

INSERT INTO EMPLOYEE VALUES
(10000, NULL, 9000),
(10001, NULL, 8500),
(10002, 10000, 9000),
(10003, 10002, 7000),
(10004, 10001, 9500),
(10005, 10003, 7500),
(10006, 10003, 5000);


SELECT
    employee_id,
    salary
FROM
    EMPLOYEE
WHERE
    employee_id IN (
        SELECT DISTINCT
            manager_id
        FROM
            EMPLOYEE
        WHERE
            salary < 8000
    )
ORDER BY
    employee_id;