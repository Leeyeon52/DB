-- 아래는 STUDENT 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC STUDENT;

-- 1. 윈도우 함수, CUME_DIST를 이용하여 성적에 대한 누적 백분율 값을 확인하세요.


-- 2. 1번에서 확인한 누적 백분율 값에 대해 조건을 걸어, 상위 30%초과 상위 70%이내 학생들을 출력하세요.


CREATE TABLE STUDENT(
ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
SCORE INTEGER
);

INSERT INTO STUDENT(SCORE) VALUES(81);
INSERT INTO STUDENT(SCORE) VALUES(7);
INSERT INTO STUDENT(SCORE) VALUES(83);
INSERT INTO STUDENT(SCORE) VALUES(86);
INSERT INTO STUDENT(SCORE) VALUES(87);
INSERT INTO STUDENT(SCORE) VALUES(45);
INSERT INTO STUDENT(SCORE) VALUES(40);
INSERT INTO STUDENT(SCORE) VALUES(85);
INSERT INTO STUDENT(SCORE) VALUES(94);
INSERT INTO STUDENT(SCORE) VALUES(58);
INSERT INTO STUDENT(SCORE) VALUES(23);
INSERT INTO STUDENT(SCORE) VALUES(72);
INSERT INTO STUDENT(SCORE) VALUES(15);
INSERT INTO STUDENT(SCORE) VALUES(74);
INSERT INTO STUDENT(SCORE) VALUES(34);
INSERT INTO STUDENT(SCORE) VALUES(48);
INSERT INTO STUDENT(SCORE) VALUES(84);
INSERT INTO STUDENT(SCORE) VALUES(20);
INSERT INTO STUDENT(SCORE) VALUES(72);
INSERT INTO STUDENT(SCORE) VALUES(98);
INSERT INTO STUDENT(SCORE) VALUES(61);
INSERT INTO STUDENT(SCORE) VALUES(67);
INSERT INTO STUDENT(SCORE) VALUES(97);
INSERT INTO STUDENT(SCORE) VALUES(34);
INSERT INTO STUDENT(SCORE) VALUES(86);
INSERT INTO STUDENT(SCORE) VALUES(84);
INSERT INTO STUDENT(SCORE) VALUES(5);
INSERT INTO STUDENT(SCORE) VALUES(54);
INSERT INTO STUDENT(SCORE) VALUES(80);
INSERT INTO STUDENT(SCORE) VALUES(59);
INSERT INTO STUDENT(SCORE) VALUES(78);
INSERT INTO STUDENT(SCORE) VALUES(42);
INSERT INTO STUDENT(SCORE) VALUES(80);
INSERT INTO STUDENT(SCORE) VALUES(22);
INSERT INTO STUDENT(SCORE) VALUES(59);
INSERT INTO STUDENT(SCORE) VALUES(25);
INSERT INTO STUDENT(SCORE) VALUES(2);
INSERT INTO STUDENT(SCORE) VALUES(54);
INSERT INTO STUDENT(SCORE) VALUES(19);
INSERT INTO STUDENT(SCORE) VALUES(70);
INSERT INTO STUDENT(SCORE) VALUES(15);
INSERT INTO STUDENT(SCORE) VALUES(95);
INSERT INTO STUDENT(SCORE) VALUES(21);
INSERT INTO STUDENT(SCORE) VALUES(87);
INSERT INTO STUDENT(SCORE) VALUES(16);
INSERT INTO STUDENT(SCORE) VALUES(100);
INSERT INTO STUDENT(SCORE) VALUES(89);
INSERT INTO STUDENT(SCORE) VALUES(18);
INSERT INTO STUDENT(SCORE) VALUES(63);
INSERT INTO STUDENT(SCORE) VALUES(71);
INSERT INTO STUDENT(SCORE) VALUES(67);
INSERT INTO STUDENT(SCORE) VALUES(99);
INSERT INTO STUDENT(SCORE) VALUES(28);
INSERT INTO STUDENT(SCORE) VALUES(86);
INSERT INTO STUDENT(SCORE) VALUES(2);
INSERT INTO STUDENT(SCORE) VALUES(57);
INSERT INTO STUDENT(SCORE) VALUES(86);
INSERT INTO STUDENT(SCORE) VALUES(54);
INSERT INTO STUDENT(SCORE) VALUES(40);
INSERT INTO STUDENT(SCORE) VALUES(56);
INSERT INTO STUDENT(SCORE) VALUES(18);
INSERT INTO STUDENT(SCORE) VALUES(38);
INSERT INTO STUDENT(SCORE) VALUES(48);
INSERT INTO STUDENT(SCORE) VALUES(14);
INSERT INTO STUDENT(SCORE) VALUES(91);
INSERT INTO STUDENT(SCORE) VALUES(99);
INSERT INTO STUDENT(SCORE) VALUES(84);
INSERT INTO STUDENT(SCORE) VALUES(49);
INSERT INTO STUDENT(SCORE) VALUES(98);
INSERT INTO STUDENT(SCORE) VALUES(47);
INSERT INTO STUDENT(SCORE) VALUES(32);
INSERT INTO STUDENT(SCORE) VALUES(76);
INSERT INTO STUDENT(SCORE) VALUES(20);
INSERT INTO STUDENT(SCORE) VALUES(64);
INSERT INTO STUDENT(SCORE) VALUES(39);
INSERT INTO STUDENT(SCORE) VALUES(30);
INSERT INTO STUDENT(SCORE) VALUES(65);
INSERT INTO STUDENT(SCORE) VALUES(83);
INSERT INTO STUDENT(SCORE) VALUES(68);
INSERT INTO STUDENT(SCORE) VALUES(63);

select
    id,
    score,
    cumlative_percentage
from
    studentcumlativepercentage
where
    cumlative_percentage > 0.3 and cumlative_percentage <= 0.7
order by
    cumulative_percentage;





'''   원래 공식대로 하면 위에가 맞지만 student 컬림이 있어 student_dadafh 고쳤을 떄에는 아래방식으로 하면 됨됨
WITH StudentCumulativePercentage AS (
    SELECT
        ID,
        SCORE,
        CUME_DIST() OVER (ORDER BY SCORE) AS cumulative_percentage
    FROM
        STUDENT -- 실제 테이블 이름
)
SELECT
    ID,
    SCORE,
    cumulative_percentage
FROM
    StudentCumulativePercentage
WHERE
    cumulative_percentage > 0.3 AND cumulative_percentage <= 0.7
ORDER BY
    cumulative_percentage;
'''