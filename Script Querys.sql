/* Consulta 1: Quantitat de registres de la taula de vols. */
SELECT COUNT(*)
FROM  Flights f;

/* Consulta 2: Retard promig de sortida i arribada segons l’aeroport origen. */
SELECT Origin, AVG(ArrDelay) avg_delay_arrival, AVG(DepDelay) avg_delay_departure
FROM Flights f 
GROUP BY Origin;

/* Consulta 3: Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. */
SELECT Origin, colYear, colMonth, AVG(ArrDelay) avg_delay_arrival
FROM Flights f 
GROUP BY Origin, colYear 
ORDER BY Origin, colYear ASC;

/* Consulta 4: Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. Mostrant nom de la ciutat. */
SELECT u.City, f.colYear, f.colMonth, AVG(f.ArrDelay) avg_delay_arrival
FROM Flights f, USAirports u 
WHERE f.Origin = u.IATA 
GROUP BY f.Origin, f.colYear 
ORDER BY f.Origin, f.colYear ASC;

/* Consulta 5: Les companyies amb més vols cancelats, per mesos i any. A més, han d’estar ordenades de forma que les companyies amb més cancel·lacions apareguin les primeres. */
SELECT UniqueCarrier, f.colYear, f.colMonth, SUM(f.Cancelled) total_cancelled
FROM Flights f 
GROUP BY UniqueCarrier, colYear, colMonth 
ORDER BY total_cancelled DESC;

/* Consulta 6: L’identificador dels 10 avions que més distància han recorregut fent vols. */
SELECT TailNum, SUM(Distance) total_distance 
FROM Flights f 
WHERE TailNum IS NOT NULL 
GROUP BY TailNum
ORDER BY total_distance DESC;

/* Consulta 7: Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben al seu destí amb un retràs promig major de 10 min. */
SELECT UniqueCarrier, AVG(ArrDelay) avg_delay_arrival
FROM Flights f 
GROUP BY UniqueCarrier
HAVING
    AVG(ArrDelay) > 10
ORDER BY avg_delay_arrival DESC;
