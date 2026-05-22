#rename columns

alter table adidas_sales
rename column `ï»¿Retailer_ID` to retailer_id,
rename column `Retailer` to retailer,
rename column `Invoice_Date` to invoice_date,
rename column `Region` to region,
rename column `State` to state,
rename column `City` to city,
rename column `Product` to product,
rename column `Price_per_Unit` to price_per_unit,
rename column `Units_Sold` to units_sold,
rename column `Total_Sales` to total_sales,
rename column `Operating_Profit` to operating_profit,
rename column `Operating_Margin` to operating_margin,
rename column `Sales_Method` to sales_method;

select * from adidas_sales;

-- Total Sales & Profit
SELECT 
    SUM(total_sales) AS total_revenue,
    SUM(operating_profit) AS total_profit
FROM adidas_sales;

-- sales by region
SELECT 
    region,
    SUM(total_sales) AS revenue
FROM adidas_sales
GROUP BY region
ORDER BY revenue DESC;

-- Top Products
SELECT 
    product,
    SUM(total_sales) AS revenue
FROM adidas_sales
GROUP BY product
ORDER BY revenue DESC;

-- Retailer Performance
SELECT 
    retailer,
    SUM(total_sales) AS revenue,
    SUM(operating_profit) AS profit
FROM adidas_sales
GROUP BY retailer
ORDER BY revenue DESC;

-- Monthly Trend Analysis
SELECT 
    DATE_FORMAT(invoice_date, '%Y-%m') AS month,
    SUM(total_sales) AS monthly_sales
FROM adidas_sales
GROUP BY DATE_FORMAT(invoice_date, '%Y-%m')
ORDER BY month;

-- profit margin
SELECT 
    product,
    SUM(operating_profit)/SUM(total_sales) * 100 AS profit_margin
FROM adidas_sales
GROUP BY product
ORDER BY profit_margin DESC;