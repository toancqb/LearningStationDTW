
CREATE TABLE abonne (
   nab integer NOT NULL,
   nomab varchar(40) NOT NULL default '',
   prenomab varchar(40) NOT NULL default '',
   PRIMARY KEY (nab)
);

create table categorie (
  ncat integer NOT NULL,
  libelle varchar(15) not null,
  PRIMARY KEY (ncat)
);

CREATE TABLE film (
   nfilm integer NOT NULL,
   titre varchar(70) NOT NULL default '',
   anneeProduction integer,
   realisateur varchar(70),
   ncat integer constraint ncat references categorie(ncat),
   PRIMARY KEY (nfilm)
);

CREATE TABLE dvd (
   ndvd integer NOT NULL,
   anneeAchat integer,
   moisAchat integer,
   nfilm integer constraint nfilm references film(nfilm),
   PRIMARY KEY (ndvd)
);

CREATE TABLE emprunt (
   nab integer NOT NULL constraint nab references abonne(nab),
   ndvd integer NOT NULL constraint ndvd references dvd(ndvd),
   datedeb date NOT NULL,
   datefin date,
   PRIMARY KEY (nab,ndvd,datedeb)
);

