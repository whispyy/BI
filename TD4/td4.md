# TD4 règles d'association - BI

## Exercice 1

 - A

Ici, A,B,C,D,E sont des itemset fréquents (F).
AC et CE sont passés en dessous de 30%, il sont donc un itemset rare (R).
ABC, ACD, ACE, BCE, CDE sont sortis de l'itemset (N) car c'est l'association de plusieurs éléments du niveaux du dessus dont l'un d'eux au moins est rare.

**A**(F) **B**(F) **C**(F) **D**(F) **E**(F)

**AB**(3/10 = F) **AC**(2/10 = R) **BC**(3/10) **BD**(6/10) **CD**(4/10) **AE**(4/10) **BE**(4/10) **CE**(2/10 = R) **DE**(6/10)

**ABC**(N) **ABD**(R) **ACD**(N) **BCD**(R) **ABE**(R) **ACE**(N) **ADE**(F) **BCE**(N) **BDE**(F) **CDE**(N)

**ABCD**(N) **ABCE**(N) **ABDE**(N) **ACDE**(N) **BCDE**(N)

**ABCDE**(N)

 - B

15 fréquents, 31 itemsets donc 15/31

 - C

11 non-candidats (20 candidats), 31 itemsets donc 11/31

 - D

5 rares, 20 candidats dont 5/20 = 1/4


## Exercice 2

 - A

**B**(1/3) **Ch**(2/3) **Co**(1/2) **HD**(2/3) **K**(1/3)

**BCh** **BCo** **BHD**(1/3) **BK** **ChCo**(1/2 **ChHD**(1/3) **ChK** **CoHD**(1/3) **CoK** **HDK**

**ChCoHD**(1/3)

 - Question complémentaire

minSup = 1/3  || minConf = 0,6

p(B et HD)/p(B) = 
