-- se obtiene la referencia de la tabla 

select table_name
from information_schema.KEY_COLUMN_USAGE
where table_schema = 'soliris'
and referenced_table_name = 'maestro_ventas';


SELECT DISTINCT ROUTINE_NAME, ROUTINE_TYPE 
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_DEFINITION LIKE '%mestro_ventas%';