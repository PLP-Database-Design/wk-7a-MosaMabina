
-- Question 1
WITH RECURSIVE split_products AS (
    SELECT 
        OrderID,
        CustomerName,
        SUBSTRING_INDEX(Products, ',', 1) AS Product,
        SUBSTRING(Products, LENGTH(SUBSTRING_INDEX(Products, ',', 1)) + 2) AS rest
    FROM ProductDetail

    UNION ALL

    SELECT 
        OrderID,
        CustomerName,
        SUBSTRING_INDEX(rest, ',', 1),
        SUBSTRING(rest, LENGTH(SUBSTRING_INDEX(rest, ',', 1)) + 2)
    FROM split_products
    WHERE rest <> ''
)

SELECT 
    OrderID,
    CustomerName,
    TRIM(Product) AS Product
FROM split_products;

-- -- question 2
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

SELECT OrderID, Product, Quantity
FROM OrderDetails;

