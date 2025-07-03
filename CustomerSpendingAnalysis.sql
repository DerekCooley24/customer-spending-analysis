-- Total customers by country
SELECT Country, COUNT(*) AS Num_Customers
FROM Customer
GROUP BY Country
ORDER BY Num_Customers DESC;

USA	13
Canada	8
France	5
Brazil	5
Germany	4
United Kingdom	3
Portugal	2
India	2
Czech Republic	2
Sweden	1
Spain	1
Poland	1
Norway	1
Netherlands	1
Italy	1
Ireland	1
Hungary	1
Finland	1
Denmark	1
Chile	1
Belgium	1
Austria	1
Australia	1
Argentina	1


-- Total sales by country (sum of invoice totals)
SELECT Customer.Country, SUM(Invoice.Total) AS TotalSales
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Customer.Country
ORDER BY TotalSales DESC;

USA	523.06
Canada	303.96
France	195.1
Brazil	190.1
Germany	156.48
United Kingdom	112.86
Czech Republic	90.24
Portugal	77.24
India	75.26
Chile	46.62
Ireland	45.62
Hungary	45.62
Austria	42.62
Finland	41.62
Netherlands	40.62
Norway	39.62
Sweden	38.62
Spain	37.62
Poland	37.62
Italy	37.62
Denmark	37.62
Belgium	37.62
Australia	37.62
Argentina	37.62


-- Avg amount spent per customer per country
SELECT Customer.Country,
       COUNT(DISTINCT Customer.CustomerId) AS Num_Customers,
       SUM(Invoice.Total) AS TotalSales,
       ROUND(SUM(Invoice.Total) / COUNT(DISTINCT Customer.CustomerId), 2) AS AvgSpentPerCustomer
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Customer.Country
ORDER BY AvgSpentPerCustomer DESC;

Chile	1	46.62	46.62
Ireland	1	45.62	45.62
Hungary	1	45.62	45.62
Czech Republic	2	90.24	45.12
Austria	1	42.62	42.62
Finland	1	41.62	41.62
Netherlands	1	40.62	40.62
USA	13	523.06	40.24
Norway	1	39.62	39.62
Germany	4	156.48	39.12
France	5	195.1	39.02
Sweden	1	38.62	38.62
Portugal	2	77.24	38.62
Brazil	5	190.1	38.02
Canada	8	303.96	37.99
India	2	75.26	37.63
United Kingdom	3	112.86	37.62
Spain	1	37.62	37.62
Poland	1	37.62	37.62
Italy	1	37.62	37.62
Denmark	1	37.62	37.62
Belgium	1	37.62	37.62
Australia	1	37.62	37.62
Argentina	1	37.62	37.62
