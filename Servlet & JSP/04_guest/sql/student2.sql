CREATE TABLE STUDENT2 (
	IDX NUMBER PRIMARY KEY,
	NAME VARCHAR2(30) NOT NULL,
	KOR NUMBER(3),
	ENG NUMBER(3),
	MATH NUMBER(3)
);

INSERT INTO STUDENT2 (IDX, NAME, KOR, ENG, MATH)
VALUES (1111, 'USER1', 100, 90, 80);
INSERT INTO STUDENT2 VALUES (2222, 'USER2', 100,88,70);
COMMIT;
SELECT * FROM STUDENT2;
