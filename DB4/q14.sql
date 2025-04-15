-- 아래는 STUDENT 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC STUDENT;

-- 학생들의 수학, 물리, 화학 점수의 총합 내림차순 기준으로 3개의 그룹으로 나누어 조회하는 쿼리를 작성하세요.

CREATE TABLE SsTUDENT(
	ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	MATH INTEGER,
	PHYSICS INTEGER,
	CHEMISTRY INTEGER
);

INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(100, 50, 50);
INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(57, 32, 47);
INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(88, 39, 41);
INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(92, 44, 31);
INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(17, 50, 50);
INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(100, 8, 7);
INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(77, 45, 45);
INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(69, 36, 46);
INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(81, 47, 40);
INSERT INTO SsTUDENT(MATH, PHYSICS, CHEMISTRY) VALUES(66, 36, 35);

with sstudenttotalscore as(
    select
    id,
    math,
    PHYSICS,
    CHEMISTRY,
    (math + PHYSICS + CHEMISTRY) as total_score
from
    sstudent
),
rankedstudents as(
    select
    id,
    math,
    PHYSICS,
    CHEMISTRY,
    total_score,
    ntile(3) over (order by total_score desc) as group_number
    from
        sstudenttotalscore
)
select
    id,
    math,
    PHYSICS,
    CHEMISTRY,
    total_score,
    group_number
from
    rankedstudents
order by
    group_number,
    total_score desc;

DESC STUDENT;