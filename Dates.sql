Selecting only dates with value, both American or European writing.

SELECT Datumindienst
FROM csv.test2
  WHERE str_to_date(Datumindienst, '%d-%m-%y') IS NOT NULL
    OR str_to_date(Datumindienst, '%m-%d-%y');
    
SELECT * FROM csv.test2;

csv = database 
test2 = table 

