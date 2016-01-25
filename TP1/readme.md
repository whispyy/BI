# TP1 - BI

**Durand Jean-Frédéric**

## Commandes

Importation :

> @/chemin/vers/fichier/sql

## Exercice 1
### a

> select DEPTNO, ENAME, SAL, RANK() OVER (partition by DEPTNO order by DEPTNO, SAL DESC) as RANG from EMP where DEPTNO = 10 or DEPTNO = 30;

### b

> select DEPTNO, ENAME, SAL, DENSE_RANK() OVER (partition by DEPTNO order by DEPTNO, SAL DESC) as RANG from EMP where DEPTNO = 10 or DEPTNO = 30;

### c

> select unique DEPTNO, SAL, DENSE_RANK() OVER (partition by DEPTNO order by DEPTNO, SAL DESC) as RANG from EMP where DEPTNO = 10 or DEPTNO = 20 order by DEPTNO, SAL DESC;

### d

> select JOB, sum(SAL) as TOTAL_SAL_JOB from EMP group by JOB;

> select distinct JOB, sum(SAL) over (partition by JOB) as TOTAL_SAL_JOB from EMP;

### e

La visée des deux fonctions est inverse. C'est-à-dire qu'un "group by" sert à regrouper des données qui seraient affichés sur des lignes différentes tandis qu'un "partition by" sert à diviser des résultats qui auraient été groupé.

### f


marche pas

> select DEPTNO, JOB, sum(SAL) from EMP where sum(SAL) in
( 
(select unique sum(SAL) over (partition by DEPTNO, JOB) from EMP)
union
(select unique sum(SAL) over (partition by DEPTNO) from EMP)
union
(select sum(SAL) from EMP)
);


(select unique DEPTNO, JOB, sum(SAL) over (partition by DEPTNO, JOB) from EMP order by DEPTNO, JOB) union (select unique DEPTNO, sum(SAL) over (partition by DEPTNO) from EMP);