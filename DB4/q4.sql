-- 아래 쿼리는 MEMBER 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC MEMBER;

-- 계층형 질의, WITH RECURSIVE 를 이용하여, member_id, manager_id, lvl을 출력하되
-- member_id 오름차순, lvl 오름차순 정렬을 적용하여 쿼리를 작성하세요.

CREATE TABLE MEMBER(
  	member_id		INT NOT NULL	PRIMARY KEY,
  	manager_id		INT
);


INSERT INTO MEMBER VALUES
(1000, NULL),
(1001, 1000),
(1002, 1001),
(1003, 1002),
(1004, 1002),
(1005, 1000),
(1006, 1005),
(1007, 1006);

WITH RECURSIVE EmployeeHierarchy AS (
    SELECT
        member_id,
        manager_id,
        1 AS lvl
    FROM MEMBER
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.member_id,
        e.manager_id,
        eh.lvl + 1
    FROM MEMBER e
    INNER JOIN EmployeeHierarchy eh ON e.manager_id = eh.member_id
)
SELECT
    member_id,
    manager_id,
    lvl
FROM EmployeeHierarchy
ORDER BY member_id ASC, lvl ASC;

DESC MEMBER;
