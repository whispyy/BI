-- ex1


-- 1.a
select DEPTNO, ENAME, SAL, RANK() 
    OVER (partition by DEPTNO order by DEPTNO, SAL DESC) as RANG 
    from EMP 
        where DEPTNO = 10 or DEPTNO = 30;

-- 1.b
select DEPTNO, ENAME, SAL, DENSE_RANK() OVER (partition by DEPTNO order by DEPTNO, SAL DESC) as RANG from EMP where DEPTNO = 10 or DEPTNO = 30;

-- 1.c
select unique DEPTNO, SAL, DENSE_RANK() OVER (partition by DEPTNO order by DEPTNO, SAL DESC) as RANG from EMP where DEPTNO = 10 or DEPTNO = 20 order by DEPTNO, SAL DESC;

-- 1.d (1)
select JOB, sum(SAL) as TOTAL_SAL_JOB from EMP group by JOB;

-- 1.d(2)
select distinct JOB, sum(SAL) over (partition by JOB) as TOTAL_SAL_JOB from EMP;

-- 1.f
select deptno, job, sum(sal) from EMP
    group by 
        grouping sets ((deptno),(deptno, job),());

-- 1.g (1)
select decode(deptno, null, 'TousDep', deptno, deptno), decode (job, null, 'TousEmployes', job, job), sum(sal) from EMP
group by grouping sets ((deptno),(deptno, job),());

-- 1.g (2)
select decode(deptno, null, 'TousDep', deptno, deptno), nvl(job,'TousEmployes'), sum(sal) from EMP
group by grouping sets ((deptno),(deptno, job),());