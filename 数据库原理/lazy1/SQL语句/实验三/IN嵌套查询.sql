SELECT * FROM CUSTOMER
WHERE C_CUSTKEY IN 
(SELECT O_CUSTKEY FROM ORDERS
WHERE O_ORDERKEY IN(
(
SELECT L_ORDERKEY FROM LINEITEM
WHERE L_PARTKEY IN
(SELECT P_PARTKEY FROM PART
WHERE P_MFGR='����'AND P_NAME='����ģ���ʻ��'))))