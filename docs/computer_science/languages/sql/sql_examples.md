# SQL Examples

```sql
/*

Prix des programmations inférieurs à 40 euros

*/

select prix from programation where prix < 40;

  

/*

Artistes qui ne font pas de la variété française

*/

select dinstinc nom

from artiste

where artiste.genre <> "Scène Française";

  

/*

Concerts du mois de Mars 2021

*/

select *

from concert

where concert.date like "2021-03%";

  

select *

from concert

where concert.date between "2021-03-01" and "2021-03-31";

  

/*

Les artistes qui font du rap

*/

select distinct artiste

from artiste

where artiste.genre = "Rap";

  

/*

Les concerts en Mars 2021 à Paris

*/

select *

from concert

where (

concert.date like "2021-03%"

and

concert.ville = "Paris"

);

  

/*

Les artistes qui font de la variété française

*/

select distinct nom

from artiste

where artiste.genre = "Variété française" or artiste.genre = "Scène française";

  

/*

Informations des concerts et de leurs artistes

*/

select concert.id, artiste, date, nom, genre

from artiste, concert

where concert.artiste = artiste.id;

  

/*

Trouver le nombre de concerts

*/

select count *

from concert;

  

/*

Nombre de styles différents dans la table artiste

*/

select distinct count genre

from artiste;

  

/*

Prix moyen des concerts

*/

select avg(prix)

from concert;

  

/*

Prix moyen des concerts à Paris

*/

select avg(prix)

from concert

where concert.ville = "Paris";

  

/*

Prix total de tous les concerts

*/

select sum(prix)

from concert;

  

/*

Concert le moins / plus cher

*/

select min(prix)

from concert;

  

select max(prix)

from concert;

  

/*

Prix moyen des concerts par artiste

*/

select avg(prix)

from concert

group by artiste;

  

/*

Prix moyen des concerts par artiste inférieur à 50 euros

*/

select avg(prix)

from concert

group by artist

having avg(prix) < 50;

  

/*

Date des concerts de variété française

*/

select date

from concert

where artiste.id in (

select id from artiste where artiste.genre = "Variété française"

);

  

/*

Informations de l'artiste qui donne un concert le 27 octobre 2022

*/

select *

from artiste

where artiste.id = (

select artiste from concert where concert.date = "2022-10-27"

);

  

/*

Date des concerts qui se passent après ceux de Stasbourg

*/

select date

from concert

where concert.date > (

select max(date) from concert where concert.ville = "Strasbourg"

);

  

/*

Créer une table

*/

create table concert (

ID int not null,

ARTISTE nvarchar(30),

DATE date,

VILLE nvarchar(30),

PAYS nvarchar(30),

SALLE nvarchar(30),

PRIX float CHECK (PRIX > 0),

PRIMARY KEY (ID)

FOREIGN KEY(ARTISTE),

REFERENCES ARTISTE(ID)

);

  

create table concert(

ID int not null,

SECONDARY_KEY int not null,

PRIMARY KEY(ID, SECONDARY_KEY)

);

  

/*

Supprimer une table

*/

drop table concert;

  

/*

Renommer une table

*/

rename artiste to musicians;

  

/*

Modifier une table

*/

alter table concert add nb_place int;

  

/*

Insérer des données

*/

insert into concert values (

...

);

  

/*

* td sql database requests

*/

  

/*

A. Noms et tarifs des artistes qui joueront en France en 2023

*/

select artiste.nom, programmation.prix

from artiste, concert

where concert.artiste = artiste.id and concert.pays = 'France'

and (programmation.date between '2023-01-01' and '2023-31-12');

  

/*

B. Noms et genres des artistes ayant participé au paris paradis

*/

select artiste.nom, artiste.genre

from programmation innerjoin artiste

on programmation.artiste = artiste.id innerjoin festival on programmation.festival = festival.id

where festival.nom = "Paris Paradis";

  

/*

C. Nom et genre des artistes qui jouent à Strasbourg et à Raptown

*/

select distinct artiste.nom, artiste.genre

from programmation

innerjoin artiste on programmation.artiste = artiste.id

innerjoin festival on programmation.festival = festival.id

innerjoin concert on concert.artiste = artiste.id

where programmation.ville is "Strasbourg" or festival.nom is "Raptown";

  

select nom, genre from artiste

where id in

(select dinstinc artiste from concert where ville = "Strasbourg")

and id in

(select distinct artiste from programmation where festival =

(select id from festival where nom = "Raptown"))

  

/*

D. Nom et genre des artistes qui participent à la fois à la Paris Paradis et à Raptown

*/

select artiste.nom, artiste.genre

where artiste.id in

(select distinct artiste from programmation innerjoin festival on programmation.festival = festival.id

where festival.nom = "Raptown"

and id in

(select distinct artist from programmation innerjoin festival on programation.festival - festival.id

where festival.nom = "Paris Paradis"));

  

select artiste.nom, artiste.genre

where artiste.id in

(select distinct artiste from programmation where festival in

(select festival.id from festival where festival.nom = "Paris Paradis" and festival.nom = "Raptown"))

  

/*

E. Nom des artistes dont le total des prix est supérieur à 100 euros

*/

select artise.nom, artiste.genre

from artiste innerjoin concert on concert.artiste = artiste.id

group by artiste

having sum(concert.prix) > 100;

  

/*

F. Noms des artistes qui jouent à Paris mais pas à Strasbourg

*/

select nom from artiste.Nom

where artiste.id in (

(select distinct artiste.id from concert where concert.ville = "Paris")

and artiste.id not in

(select distinct artiste.id from concert where concert.ville = "Strasbourg"));

  

/*

G. Nom des couples d'artistes dont le prix des concerts est toujours supérieur au prix des concerts du second

*/

select first_table.nom as first, second_table.nom as second

from artiste first_table, artiste second_table

where (

(select min(prix) from concert where artise = first.id)

>

(select min(prix) from concert where artise = second.id)

);

  

/*

H. Noms des artistes ayant participé à tous les festivals

*/

select artiste.nom as my_artiste

from artiste

where (

select count (distinct festival) from programation

innerjoin artist on artist.id = programation.artiste

where artiste.nom = my_artiste)

) = (select count (*) from festival);

  

/*

I. Nombre d'artiste ayant participé au Paris Paradise

*/

select count (distinct artiste)

from programation

where programmation.festival = "Paris Paradise";

  

/*

J. Moyenne des prix des concerts par année

*/

select datepart(yyyy, date), avg(prix) from concert group by datepart(yyyy, date);

  

/*

K. Insérer le tuple <7, 1, "2023-03-17", "Dijon", "France", "Zenith", 41.8>

*/

insert into concert values (7, 1, "2023-03-17", "Dijon", "France", "Zenith", 41.8);

  

/*

L. Changer le prix du concert 2 pour 15 euros

*/

update concert set prix = 15 where id = 2;

  

/*

M. Supprimer les concerts où le prix est inférieur à 30 euros

*/

delete * from concert where prix < 30;
```
