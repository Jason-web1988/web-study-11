DROP TABLE MEMBER;
-- MEMBER TABLE 생성

CREATE TABLE member(
	name varchar2(20),
	userid varchar2(10),
	pwd varchar2(10),
	email varchar2(20),
	phone char(13),
	admin number(1) DEFAULT 0,
	joinDate DATE DEFAULT sysdate,
	PRIMARY KEY (userid)
);


SELECT *
  FROM USER_TABLES
 WHERE TABLE_NAME = 'MEMBER';
 
-- 접속한 계정의 테이블별 컬럼 조회
SELECT *
  FROM USER_TAB_COLUMNS 
 WHERE table_name IN ('MEMBER');
 
-- 접속한 계정의 테이블별 제약조건 검색
SELECT *
  FROM USER_CONSTRAINTS 
 WHERE table_name IN ('MEMBER');


-- title 
CREATE TABLE title(
	TITLE_NO NUMBER PRIMARY KEY,
	TITLE_NAME VARCHAR2(40)
);


-- DEPARTMENT 테이블 생성
CREATE TABLE DEPARTMENT (
    DEPT_NO     NUMBER(2),
    DEPT_NAME   VARCHAR2(20),
    FLOOR       NUMBER(2) DEFAULT 2,
    CONSTRAINT  DEPARTMENT_DEPTNO_PK       PRIMARY KEY (DEPT_NO),
    CONSTRAINT  DEPARTMENT_DEPTNAME_UK     UNIQUE(DEPT_NAME),
    CONSTRAINT  DEPARTMENT_DEPTNAME_NN     CHECK(DEPT_NAME IS NOT NULL)
);

-- EMPLOYEE 테이블 생성
CREATE TABLE EMPLOYEE (
    EMP_NO   NUMBER,
    EMP_NAME VARCHAR2(20) NOT NULL,
    TNO      NUMBER,
    MANAGER  NUMBER,
    SALARY   NUMBER,
    DNO      NUMBER,
    EMAIL    varchar2(60) NOT NULL,
    PASSWD   varchar2(60) NOT NULL,
    REGDATE  DATE DEFAULT SYSDATE,
    TEL      char(13),
    pic_url  varchar2(100),
    CONSTRAINT EMPLOYEE_EMPNO_PK   PRIMARY KEY (EMP_NO),
    CONSTRAINT EMPLOYEE_TNO_FK     FOREIGN KEY (TNO)     REFERENCES TITLE(TITLE_NO) ON DELETE SET NULL, 
    CONSTRAINT EMPLOYEE_MANAGER_FK FOREIGN KEY (MANAGER) REFERENCES EMPLOYEE(EMP_NO),
    CONSTRAINT EMPLOYEE_SALARY_CK  CHECK (SALARY < 6000000),
    CONSTRAINT EMPLOYEE_DNO_FK     FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DEPT_NO) ON DELETE CASCADE
);


CREATE OR REPLACE VIEW VW_EMPLOYEE_JOIN AS 
SELECT e.EMP_NO, e.EMP_NAME, e.TNO, e.MANAGER , e.SALARY, e.DNO, e.REGDATE, e.EMAIL , e.TEL , e.PIC_URL, 
       t.TITLE_NAME, d.DEPT_NAME, m.EMP_NAME MANAGER_NAME
  FROM EMPLOYEE e JOIN TITLE t ON e.TNO = t.TITLE_NO 
       LEFT JOIN EMPLOYEE m ON e.MANAGER = m.EMP_NO 
       JOIN DEPARTMENT d ON e.DNO = d.DEPT_NO; 


      
      
      
      
CREATE TABLE product(
	code number(5) PRIMARY KEY,
	name varchar2(100),
	price number(8),
	pictureurl varchar2(50),
	description varchar2(1000)
);
      
CREATE SEQUENCE PRODUCT_SEQ
	START WITH 1
	INCREMENT BY 1;

--트리거를 이용하여 자동으로 번호가 입력되도록 설정
CREATE OR REPLACE TRIGGER TRI_PRODUCT_CODE_AUTOSEQ
BEFORE INSERT ON product
FOR EACH ROW 
BEGIN 
	IF INSERTING AND :NEW.CODE IS NULL THEN
		SELECT PRODUCT_SEQ.NEXTVAL INTO :NEW.CODE FROM DUAL;
	END IF;
END; 


DROP TABLE product;
DROP TRIGGER TRI_PRODUCT_CODE_AUTOSEQ; 
DROP SEQUENCE PRODUCT_SEQ;


