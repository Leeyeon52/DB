-- 아래 쿼리는 CLASS_REQUEST, STUDENT, CLASS 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC CLASS_REQUEST;
DESC STUDENT;
DESC CLASS;

-- 1. CLASS_REQUEST 테이블에 대해 JOIN절과 USING을 이용해 STUDENT테이블과 결합하여
-- 신청번호(REQUEST_ID)와 학생이름(STUDENT_NAME)을 조회하는 쿼리를 작성해보세요.


-- 2. CLASS_REQUEST 테이블에 대해 JOIN절과 USING을 이용해 CLASS테이블과 결합하여
-- 신청번호(REQUEST_ID)와 과목이름(CLASS_NAME)을 조회하는 쿼리를 작성해보세요.


-- 3. CLASS_REQUEST 테이블에 대해 JOIN절과 USING을 이용해 STUDENT테이블, CLASS테이블과 결합하여
-- 신청번호(REQUEST_ID)와 학생이름(STUDENT_NAME), 과목이름(CLASS_NAME)을 조회하는 쿼리를 작성해보세요.

CREATE TABLE STUDENT(
	STUDENT_ID		VARCHAR(10)	NOT NULL PRIMARY KEY,
	STUDENT_NAME	VARCHAR(30) NOT NULL
);

INSERT INTO STUDENT VALUES
('S001', 'Kim'),
('S002', 'Moon'),
('S003', 'Lee');

CREATE TABLE CLASS(
	CLASS_ID		VARCHAR(10) NOT NULL PRIMARY KEY,
	CLASS_NAME	    VARCHAR(30) NOT NULL
);

INSERT INTO CLASS VALUES
('C001', 'Math'),
('C002', 'Korean');


CREATE TABLE CLASS_REQUEST(
	REQUEST_ID	VARCHAR(10) NOT NULL PRIMARY KEY,
	STUDENT_ID	VARCHAR(10) NOT NULL,
	CLASS_ID	VARCHAR(10) NOT NULL
);

INSERT INTO CLASS_REQUEST VALUES
('R0001', 'S001', 'C002'),
('R0002', 'S002', 'C001'),
('R0003', 'S002', 'C002'),
('R0004', 'S003', 'C001');

select
	cr.REQUEST_ID,
	s.STUDENT_NAME
from
	CLASS_REQUEST cr
join
	STUDENT USING(STUDENT_ID);

select
	cr.REQUEST_ID,
	c.CLASS_NAME
from
	CLASS_REQUESt cr
join
	CLASS c using (class_id);

select
	cr.requets_id,
	s.student_name,
	c.class_name
from
	class_request cr
join
	student s using (student_id)
join
	class c using (class_id);
	