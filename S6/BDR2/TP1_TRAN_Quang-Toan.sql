-- Incomplete: Q9, Q18

-- Q1
SELECT * FROM film;

-- Q2
SELECT nomab, prenomab FROM abonne ORDER BY nomab;

-- Q3
SELECT UPPER(nomab || ' ' || prenomab) FROM abonne ORDER BY nomab;

-- Q4
SELECT titre FROM film WHERE anneeProduction < 2005;

-- Q5
SELECT titre FROM film WHERE anneeProduction <= 2010 AND anneeProduction >= 2005 ORDER BY titre;

-- Q6
SELECT * FROM film WHERE upper(titre) LIKE 'P%';

-- Q7
SELECT * FROM film WHERE upper(titre) LIKE '%SE%';

-- Q8
SELECT DISTINCT c.ncat FROM categorie AS c, film as F WHERE C.ncat = F.ncat;

-- Q9
-- SELECT libelle, COUNT(DISTINCT c.ncat) FROM categorie AS c, film as F WHERE C.ncat = F.ncat;

-- Q10
SELECT COUNT(DISTINCT F.nfilm) FROM film as F, dvd as D WHERE F.nfilm = D.nfilm;

-- Q11
SELECT COUNT(*) FROM film WHERE realisateur = 'Woody Allen';

-- Q12
SELECT COUNT(*) FROM abonne WHERE UPPER(nomab) LIKE 'C%';

-- Q13
SELECT titre, anneeProduction FROM film WHERE realisateur = 'Tim Burton';

-- Q14
SELECT titre FROM film WHERE anneeProduction = 2008 OR anneeProduction = 2009;

-- Q15
SELECT titre FROM film WHERE anneeProduction != 2007 AND anneeProduction != 2008 AND anneeProduction != 2009;

-- Q16
SELECT MAX(anneeProduction) FROM film WHERE realisateur = 'Clint Eastwood';

-- Q17
SELECT MAX(datefin - datedeb) FROM emprunt;

-- Q18


-- Q19
SELECT COUNT(*) FROM film WHERE realisateur = 'Quentin Tarantino' AND anneeProduction >= 2000 AND anneeProduction < 2100;

-- Q20
SELECT COUNT(DISTINCT ndvd) FROM dvd;

