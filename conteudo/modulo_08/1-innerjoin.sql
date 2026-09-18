SELECT p.type1 , sum(sl.quantidade)
from pokemon as p
inner join safari_log as sl
on p.pokedex_number = sl.pokedex_number
GROUP by p.type1
order by sum(sl.quantidade) desc

SELECT p.type1  , sum(sl.quantidade) , sl.cidade
from pokemon as p
inner join safari_log as sl
on p.pokedex_number = sl.pokedex_number
GROUP by p.name, sl.cidade
order by sum(sl.quantidade) desc, cidade asc

SELECT p.name , sum(sl.quantidade) 
from pokemon as p
inner join safari_log as sl
on p.pokedex_number = sl.pokedex_number
GROUP by p.name
order by sum(sl.quantidade) 


SELECT p.name, sl.sexo, sum(sl.quantidade) 
from 
pokemon as p
inner join safari_log as sl
on p.pokedex_number = sl.pokedex_number
GROUP by p.name, sl.sexo
