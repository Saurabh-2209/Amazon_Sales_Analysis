show databases;

use amazon_sales;

select * from sales;

select count(*) from sales;
-- Amazon Sales dataset contains 121143 records

select ship_state, count(*) from sales group by 1 order by 2;
-- Amazon has its maximum sales in maharashtra

select * from (select ship_state, ship_city, round(sum(amount),2) as total_amount, rank() over(partition by ship_state order by sum(amount) desc) as Sales_Rank from sales group by 1,2) t
where Sales_Rank =1;
-- each state and its city with highest sales

select round(sum(amount),2) from sales;
-- amazon has done 78570548.25 INR of sales in (march, april, may, june) 2022

select month, count(*) as total_sales, round(sum(amount),2) as total_amount from sales group by 1 order by 2 desc;
-- month wise sales and amount

select category, sum(qty) from sales group by 1 order by 2 desc;
-- category wise sales
-- T-Shirt (45217) maximum

select ship_city, count(*) from sales group by 1 order by 2 desc limit 5;
-- sales by top 5 city

select * from (select ship_state, category, count(*), rank() over(partition by ship_state order by count(*) desc) as sales_rank from sales group by 1,2) t where sales_rank = 1; 
-- state wise most selled category

/*
1) Sales Analysis
*/
-- Which states or cities generate the most revenue?
select ship_state, round(sum(amount),2) from sales group by 1 order by 2 desc;
-- Maharashtra state generate most revenue

select ship_city, round(sum(amount),2) from sales group by 1 order by 2 desc;
-- Bengaluru city generates most revenue


-- Which categories are top-selling based on total sales amount or quantity?
select category, round(sum(amount),2) from sales group by 1 order by 2 desc limit 3;
-- T-Shirt (39197808.65), Shirt (21289304.08) and Blazzer (11214369.12) are top 3 selling categories based on amount

select category, sum(qty) from sales group by 1 order by 2 desc;
-- T-Shirt (45217), Shirt (44954) and Blazzer (13938) are top 3 selling categories based on quantity
/*
2) Order Fulfillment
*/

-- Which fulfillment method (Amazon vs Merchant) results in more cancellations?
select fulfilment, count(*)  from sales where status = "cancelled" group by 1 ;
-- Amazon -> 5627
-- Merchant -> 5131

/*
3) Customer Behavior
*/
-- What are the trends in product size purchases across different regions?
select ship_state, size, count(*), rank() over(partition by ship_state order by count(*) desc) as size_rank from sales group by 1,2;

-- Are there patterns in order volume by weekday or month?
select month, count(*) from sales group by 1 order by 2 desc;
-- April (46049)

select day, count(*) from sales group by 1 order by 2 desc;

/*
4) Returns/Cancellations
		What percentage of orders are cancelled? Are cancellations higher for specific product categories, cities, or fulfillment methods?
*/
SELECT 
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(
        100.0 * SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS cancellation_percentage
FROM sales;
-- 8.88 % cancellation rate

-- Cancellation percentage category wise
SELECT 
	category,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(
        100.0 * SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS cancellation_percentage
FROM sales
group by category
order by cancellation_percentage desc;
/*
	Category   total_orders  cancelled_orders   Cancellation_percentage
	Socks		420				40					9.52
	Blazzer		14702			1335				9.08
	Shirt		46695			4185				8.96
	T-shirt		47038			4202				8.93
	Wallet		881				75					8.51
	Trousers	10157			829					8.16
	Shoes		156				12					7.69
	Perfume		1091			80					7.33
	Watch		3				0					0.00
*/

select B2B, count(*) from sales group by 1;