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

select deptno, job, sum(sal) from EMP
group by grouping sets ((deptno),(deptno, job),());

### g

```SQL
select decode(deptno, null, 'TousDep', deptno, deptno), decode (job, null, 'TousEmployes', job, job), sum(sal) from EMP
group by grouping sets ((deptno),(deptno, job),());
```

ou

```SQL
select decode(deptno, null, 'TousDep', deptno, deptno), nvl(job,'TousEmployes'), sum(sal) from EMP
group by grouping sets ((deptno),(deptno, job),());
```

