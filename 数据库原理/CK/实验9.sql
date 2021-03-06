CREATE DATABASE spj;

CREATE TABLE S
(
  SNO    CHAR(10) PRIMARY KEY,
  SNAME  CHAR(10),
  STATUS INTEGER,
  CITY   CHAR(10)
)

CREATE TABLE P
(
PNO    CHAR(10) PRIMARY KEY,
PNAME  CHAR(10),
COLOR  CHAR(10),
WEIGHT INTEGER
)

CREATE TABLE J
(
    JNO   CHAR(10) PRIMARY KEY,
    JNAME CHAR(10),
    CITY  CHAR(10)
)

CREATE TABLE SPJ
(
    SNO CHAR(10),
    PNO CHAR(10),
    JNO CHAR(10),
    QTY INT,
    PRIMARY KEY(SNO,PNO,JNO),
    FOREIGN KEY (SNO) REFERENCES S(SNO),
    FOREIGN KEY (PNO) REFERENCES P(PNO),
    FOREIGN KEY (JNO) REFERENCES J(JNO)
)

INSERT into S
VALUES('S1','精益',20,'天津')
INSERT into S
VALUES('S2','盛锡',10,'北京')
INSERT into S
VALUES('S3','东方红',30,'北京')
INSERT into S
VALUES('S4','丰泰盛',20,'天津')
INSERT into S
VALUES('S5','为民',30,'上海')

insert into p(pno,pname,color,weight)
values('P1','螺母','红',12),('P2','螺栓','绿',17),('P3','螺丝刀','蓝',14),('P4','螺丝刀','红',14),
('P5','凸轮','蓝',40),('P6','齿轮','红',30)

INSERT into J
VALUES('J1','三建','北京')
INSERT into J
VALUES('J2','一汽','长春')
INSERT into J
VALUES('J3','弹簧厂','天津')
INSERT into J
VALUES('J4','造船厂','天津')
INSERT into J
VALUES('J5','机车厂','唐山')
INSERT into J
VALUES('J6','无线电厂','常州')
INSERT into J
VALUES('J7','半导体厂','南京')

INSERT into SPJ
VALUES('S1','P1','J1',200)
INSERT into SPJ
VALUES('S1','P1','J3',100)
INSERT into SPJ
VALUES('S1','P1','J4',700)
INSERT into SPJ
VALUES('S1','P2','J2',100)
INSERT into SPJ
VALUES('S2','P3','J1',400)
INSERT into SPJ
VALUES('S2','P3','J2',200)
INSERT into SPJ
VALUES('S2','P3','J4',500)
INSERT into SPJ
VALUES('S2','P3','J5',400)
INSERT into SPJ
VALUES('S2','P5','J1',400)
INSERT into SPJ
VALUES('S2','P5','J2',100)
INSERT into SPJ
VALUES('S3','P1','J1',200)
INSERT into SPJ
VALUES('S3','P3','J1',200)
INSERT into SPJ
VALUES('S4','P5','J1',100)
INSERT into SPJ
VALUES('S4','P6','J3',300)
INSERT into SPJ
VALUES('S4','P6','J4',200)
INSERT into SPJ
VALUES('S5','P2','J4',100)
INSERT into SPJ
VALUES('S5','P3','J1',200)
INSERT into SPJ
VALUES('S5','P6','J2',200)
INSERT into SPJ
VALUES('S5','P6','J4',500)


SELECT sname,city
FROM S

SELECT pname,COLOR,WEIGHT
from p

SELECT JNO
from SPJ
WHERE SNO = 'S1'

SELECT P.PNAME,SPJ.QTY
from SPJ,P
WHERE SPJ.JNO = 'J2' AND SPJ.PNO = P.PNO

select P.PNO
from P,S,SPJ
WHERE S.CITY = '上海' AND SPJ.SNO = S.SNO AND SPJ.PNO = P.PNO


select J.JNAME 
from S,SPJ,J
WHERE S.CITY = '上海' AND SPJ.SNO = S.SNO AND SPJ.JNO = J.JNO

SELECT  DISTINCT J.JNO
from S,SPJ,J
WHERE S.CITY != '天津' AND SPJ.SNO = S.SNO AND SPJ.JNO = J.JNO

UPDATE P
SET P.COLOR = '蓝'
WHERE P.COLOR = '红'

UPDATE SPJ
SET SNO = 'S3'
WHERE SNO = 'S5' AND JNO = 'J4' AND PNO = 'P6'


ALTER TABLE SPJ
add CONSTRAINT c2 FOREIGN key (SNO) REFERENCES S(SNO) ON DELETE cascade
DELETE
From S 
WHERE S.SNO = 'S2' 

INSERT into S
VALUES('S2','盛锡',10,'北京')
INSERT into SPJ
VALUES('S2','P4','J6',200)

SELECT * 
from SPJ
WHERE SNO = 'S3' AND JNO = 'J4' AND PNO = 'P6'

SELECT *
FROM SPJ