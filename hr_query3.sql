use hr_database
select COUNTRY_NAME
from COUNTRIES
where COUNTRY_NAME like '%a' or  COUNTRY_NAME like 'A%'

select COUNTRY_NAME
from COUNTRIES
where COUNTRY_NAME like '_r%' or  COUNTRY_NAME like '__r%'

select REGION_ID
from COUNTRIES
where REGION_ID between 1 and 3

select COUNTRY_NAME
from COUNTRIES
where COUNTRY_NAME in ('Argentina','Messico','Brasile')

