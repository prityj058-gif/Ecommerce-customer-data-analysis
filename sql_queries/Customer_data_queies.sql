SELECT 
    *
FROM
    customer_purchase_analysis.ecommerce_customer_dataset
LIMIT 10;

SELECT 
    COUNT(*)
FROM
    ecommerce_customer_dataset;

SELECT 
    *
FROM
    ecommerce_customer_dataset
WHERE
    `Customer ID` IS NULL
        OR `Product Category` IS NULL
        OR `Purchase Date` IS NULL;

SELECT 
    `Customer ID`, `Purchase Date`, COUNT(*)
FROM
    ecommerce_customer_dataset
GROUP BY `Customer ID` , `Purchase Date`
HAVING COUNT(*) > 1;


/****---- START ANALYSIS ----****/

/** TOTAL REVENUE**/
SELECT 
    SUM(`Total Purchase Amount`)
FROM
    ecommerce_customer_dataset;

/** REVENUE BY PRODUCT CATEGORY **/
SELECT 
    `Product Category`, SUM(`Total Purchase Amount`) AS revenue
FROM
    ecommerce_customer_dataset
GROUP BY `Product Category`
ORDER BY revenue DESC;

/** TOP CUSTOMERS **/
 SELECT 
    `Customer ID`, SUM(`Total Purchase Amount`) AS total_spent
FROM
    ecommerce_customer_dataset
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 10;

/** ANALYZE PRODUCT SALES **/
SELECT 
    `Product Category`, COUNT(*) AS total_orders
FROM
    ecommerce_customer_dataset
GROUP BY `Product Category`
ORDER BY total_orders DESC; 

/** FIND AVERAGE ORDER VALUE **/
SELECT 
    AVG(`Total Purchase Amount`) AS avg_order_value
FROM
    ecommerce_customer_dataset;

/** CUSTOMER AGE ANALYSIS **/
SELECT 
    `Customer Age`, COUNT(*) AS total_orders
FROM
    ecommerce_customer_dataset
GROUP BY `Customer Age`
ORDER BY total_orders DESC;

/** RETURN ANALYSIS **/
SELECT 
    Returns, COUNT(*) AS total_orders
FROM
    ecommerce_customer_dataset
GROUP BY Returns;

/** PAYMENT METHOD ANALYSIS **/
SELECT 
    `Payment Method`, COUNT(*) AS total_orders
FROM
    ecommerce_customer_dataset
GROUP BY `Payment Method`
ORDER BY total_orders DESC;

/****---- END ----****/

