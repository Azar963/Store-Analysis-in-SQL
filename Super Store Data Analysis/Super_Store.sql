Create database sample_store;
use sample_store;

# 1. Find the maximum Quantity sold in a transaction
SELECT 
    MAX(Quantity), COUNT(*)
FROM
    tr_orderdetails;
    
# 2. Find the unique products in all the Trasactions

SELECT DISTINCT
    ProductID, Quantity
FROM
    tr_orderdetails
WHERE
    Quantity = 3
ORDER BY ProductID ASC , Quantity DESC;

# 3.Also, Find the unique Properties

SELECT DISTINCT
    PropertyID
FROM
    tr_orderdetails;
    
# 4. Find the product category that has maximum products.

SELECT 
    ProductCategory, COUNT(*) AS COUNT
FROM
    tr_products
GROUP BY ProductCategory
ORDER BY 2 DESC;

# 5. Find the state where most stores are present
SELECT 
    PropertyState, COUNT(*) AS COUNT
FROM
    tr_propertyinfo
GROUP BY PropertyState
ORDER BY 2 DESC;

# 6. Find the top 5 product ids that did maximum sales in terms of quantity.

SELECT 
    ProductID, SUM(Quantity) AS Total_Quantity
FROM
    tr_orderdetails
GROUP BY ProductID
ORDER BY 2 DESC
LIMIT 5;

# 7.Similarly, find the top 5 property id's taht did maximum Quantity

SELECT 
    PropertyID, COUNT(*) AS COUNT
FROM
    tr_orderdetails
GROUP BY PropertyID
ORDER BY 2 DESC
LIMIT 5;

# 8. Find the top 5 product names that did maximum slaes in terms of quantity

SELECT 
    p.ProductName, SUM(Quantity) AS Total_Quantity
FROM
    tr_orderdetails AS o
        LEFT JOIN
    tr_products AS p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY 2 DESC
LIMIT 5;

#8.1 Then find the top 5 products that did maximum sales

SELECT 
    p.ProductName, SUM(o.Quantity * p.Price) AS Sales
FROM
    tr_orderdetails AS o
        LEFT JOIN
    tr_products AS p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Sales DESC
LIMIT 5;

# 9. Find the top 5 cities that did maximum sales

SELECT 
    pi.PropertyCity, SUM(o.Quantity * p.Price) AS Sales
FROM
    tr_orderdetails AS o
        LEFT JOIN
    tr_products AS p ON o.ProductID = p.ProductID
        LEFT JOIN
    tr_propertyinfo AS pi ON o.PropertyID = pi.`Prop ID`
GROUP BY pi.PropertyCity
ORDER BY Sales DESC
LIMIT 5;

# 10. Find the top 5 products in each of the cities

SELECT 
    pi.PropertyCity,
    p.ProductName,
    SUM(o.Quantity * p.Price) AS Sales
FROM
    tr_orderdetails AS o
        LEFT JOIN
    tr_products AS p ON o.ProductID = p.ProductID
        LEFT JOIN
    tr_propertyinfo AS pi ON o.PropertyID = pi.`Prop ID`
WHERE
    pi.PropertyCity = 'Arlington'
GROUP BY pi.PropertyCity , p.ProductName
ORDER BY Sales DESC
LIMIT 5;


