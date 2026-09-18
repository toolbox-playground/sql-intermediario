-- 
SELECT p.name, sum(es.quantidade)
from eventos_safari as es
inner join pokemon as p
on es.pokedex_number = p.pokedex_number
GROUP BY p.name
ORDER BY sum(es.quantidade) DESC

--
SELECT sum(es.quantidade)
from eventos_safari as es
inner join pokemon as p
on es.pokedex_number = p.pokedex_number
