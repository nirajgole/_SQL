//String ending with a,e,i,o,u

SELECT DISTINCT city
FROM station
WHERE city 
REGEXP ".*[aeiou]$"


//string starting and ending with a,e,i,o,u

SELECT DISTINCT city
FROM station
WHERE city
REGEXP "^[aeiou].*[aeiou]$"


//Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
 Your result cannot contain duplicates.

SELECT DISTINCT city 
FROM station 
WHERE left(city,1) not regexp 'a|e|i|o|u' and right(city,1) not regexp 'a|e|i|o|u' 
GROUP BY city