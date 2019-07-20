/* Week 1 Assignment: SQL Select and Aggregations*/

/*1 Which destination in the flights database is the furthest distance away, based on information in the flights table. 
Show the SQL query(s) that support your conclusion. */

SELECT origin, dest, distance FROM flights ORDER BY distance DESC LIMIT 1;    

/*2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the 
SQL statement(s) that support your result.*/

SELECT DISTINCT engines, max(seats) FROM planes GROUP BY engines ORDER By max(seats) DESC;


/*3. Show the total number of flights.*/

 SELECT COUNT(*) FROM flights;

/*4. Show the total number of flights by airline (carrier).*/
 
 SELECT carrier, COUNT(*) TotalFlights FROM flights GROUP BY carrier;


/*  5. Show all of the airlines, ordered by number of flights in descending order. */

SELECT f.carrier, MAX(a.name) CarrierName, COUNT(*) TotalFlights FROM flights f INNER JOIN	airlines a ON f.carrier = a.carrier
GROUP BY carrier ORDER BY COUNT(*) DESC;

/*6 Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.*/

SELECT f.carrier, MAX(a.name) CarrierName, COUNT(*) TotalFlights FROM flights f INNER JOIN	airlines a ON f.carrier = a.carrier
GROUP BY carrier ORDER BY COUNT(*) DESC limit 5;

/* 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
flights in descending order.*/

SELECT f.carrier, MAX(a.name) CarrierName, COUNT(*) FROM flights f INNER JOIN	airlines a ON f.carrier = a.carrier
WHERE f.distance >= 1000 GROUP BY carrier ORDER BY COUNT(*) DESC LIMIT 5;


/*8 Show number of flights between airports arranged in descending order by number of flights */

SELECT origin,dest,COUNT(*) as number_of_flights FROM flights GROUP BY origin,dest ORDER BY number_of_flights DESC;

