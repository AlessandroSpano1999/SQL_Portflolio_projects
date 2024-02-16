use aerei
go
--1)Le compagnie aeree per cui non è specificato il sito web.
select id_compagnia,[sitoweb]
from compagnie
where sitoweb is null
--2)La nazione di partenza e la nazione di arrivo del volo con codice volo "A357Z".
select a.nazione
from aeroporti a
join voli v on a.id_aeroporto=v.id_aeroporto_partenza or a.id_aeroporto=v.id_aeroporto_arrivo
where v.codice_volo LIKE '%A357Z%'
--3)Il nome della compagnia dell'aereo usato nel volo con id_volo uguale a 5.
select v.id_aereo,a.id_compagnia,c.nome
from voli v
join aerei a on v.id_aereo=a.id_aereo
join compagnie c on a.id_compagnia=c.id_compagnia
where v.id_volo=5
--4)Gli aereoporti da cui partono voli internazionali. 
--(Sugg: un volo è considerato internazionale se parte l'aeroporto di arrivo si trova in una nazione diversa dall'aeroporto di partenza).
select id_aeroporto_partenza,id_aeroporto_arrivo,p.nazione,a.nazione
from voli v
join aeroporti a on v.id_aeroporto_arrivo=a.id_aeroporto
join aeroporti p on  v.id_aeroporto_partenza=p.id_aeroporto
where a.nazione!=p.nazione
--5)Gli aeroporti italiani da cui sono partiti più di 2 voli.
select p.id_aeroporto,count(v.id_aeroporto_partenza) as partenze_tot
from voli v
join aeroporti p on p.id_aeroporto=v.id_aeroporto_partenza
where p.nazione='Italia'
group by p.id_aeroporto
--6)Per ogni compagnia indicare il numero di aerei che ha.
select c.id_compagnia,count(a.id_aereo) as aerei_tot,c.nome
from aerei a
join compagnie c on a.id_compagnia=c.id_compagnia
group by c.id_compagnia,c.nome
--7)Per ogni città indicare il numero di aeroporti presenti.
select citta,count(id_aeroporto) as aereoporti_tot
from aeroporti
group by citta
--8)Il nome degli aeroporti che hanno il maggior numero di piste.
select nome,num_piste
from aeroporti
order by num_piste desc
--9)La media del peso del bagaglio incluso nel prezzo dalle compagnie aeree.
select avg(peso_bagaglio_incluso) as media_bagaglio,nome
from compagnie
group by nome
order by media_bagaglio asc
--10)Nomi delle nazioni con più aeroporti.
select count(id_aeroporto) as tot_aeroporti,nazione
from aeroporti
group by nazione
order by tot_aeroporti desc



