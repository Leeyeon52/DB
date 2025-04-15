-- WITH RECURSIVE 를 이용하여 계층형 질의를 작성해보세요.

CREATE TABLE MEMBERS(
  	mentee_id		INT NOT NULL	PRIMARY KEY,
  	mento_id		INT
);


INSERT INTO MEMBERS VALUES
(1000, NULL),
(1001, NULL),
(1002, 1000),
(1003, 1001),
(1004, 1000),
(1005, 1002),
(1006, 1003),
(1007, 1004),
(1008, 1002),
(1009, 1005),
(1010, 1006),
(1011, 1010);

WITH RECURSIVE MenteeHierarchy AS (
    SELECT
        mentee_id,
        mento_id,
        1 AS lvl,
        CAST(mentee_id AS CHAR(200)) AS path
    FROM MEMBERS
    WHERE mento_id IS NULL

    UNION ALL

    SELECT
        m.mentee_id,
        m.mento_id,
        mh.lvl + 1,
        CAST(CONCAT(mh.path, '->', m.mentee_id) AS CHAR(200)) AS path
    FROM MEMBERS m
    INNER JOIN MenteeHierarchy mh ON m.mento_id = mh.mentee_id
)
SELECT
    mentee_id,
    mento_id,
    lvl,
    path
FROM MenteeHierarchy
ORDER BY mentee_id;
