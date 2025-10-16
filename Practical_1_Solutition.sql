--BrightLight Data Analytics Coding Practical
--Practical 1: SQL Fundamentals (Snowflake-Basic SQL Syntax)



--___QUESTIONS_________________________________________________________________________________________________________

--1. SELECT Statement
--Q1. Display all columns for all transactions.
---Expected output: All columns

select * 
    from practicals.practical_1.retail_sales;   
    
-----------------------------------------------------------------------------------------------------------------------

--Q2. Display only the Transaction ID, Date, and Customer ID for all records.
--Expected output: Transaction ID, Date, Customer ID

select transaction_id,
        date,
        customer_id
    from practicals.practical_1.retail_sales;
        
-----------------------------------------------------------------------------------------------------------------------

--Q3. Display all the distinct product categories in the dataset.
--Expected output: Product Category

select distinct(PRODUCT_CATEGORY) as Product_Category
    from practicals.practical_1.retail_sales;
    
-----------------------------------------------------------------------------------------------------------------------

--Q4. Display all the distinct gender values in the dataset.
--Expected output: Gender


select distinct(Gender) as GENDER
    from practicals.practical_1.retail_sales;
    
-----------------------------------------------------------------------------------------------------------------------

--Q5. Display all transactions where the Age is greater than 40.
--Expected output: All columns

select *
    from practicals.practical_1.retail_sales
    where age > 40;
    
-----------------------------------------------------------------------------------------------------------------------

--Q6. Display all transactions where the Price per Unit is between 100 and 500.
--Expected output: All columns

select *
    from practicals.practical_1.retail_sales
    where price_per_unit between 100 and 500;

-----------------------------------------------------------------------------------------------------------------------

--Q7. Display all transactions where the Product Category is either 'Beauty' or
--'Electronics'.

select *
    from practicals.practical_1.retail_sales
    where product_category  in ('Beauty', 'Electronics');

-----------------------------------------------------------------------------------------------------------------------

--Q8. Display all transactions where the Product Category is not 'Clothing'.
--Expected output: All columns

select *
    from practicals.practical_1.retail_sales
    where product_category  not in ('Clothing');
    
-----------------------------------------------------------------------------------------------------------------------

--Q9. Display all transactions where the Quantity is greater than or equal to 3.
--Expected output: All columns

select *
    from practicals.practical_1.retail_sales
    where Quantity >= 3 ;


-----------------------------------------------------------------------------------------------------------------------

--Q10. Count the total number of transactions.
--Expected output: Total_Transactions

select count(*) as Total_Transactions
    from practicals.practical_1.retail_sales;


-----------------------------------------------------------------------------------------------------------------------

--Q11. Find the average Age of customers.
--Expected output: Average_Age

select AVG(age) as Average_Age
    from practicals.practical_1.retail_sales;

-----------------------------------------------------------------------------------------------------------------------

--Q12. Find the total quantity of products sold.
--Expected output: Total_Quantity

select sum(quantity) as Total_Quantity
    from practicals.practical_1.retail_sales;
    

-----------------------------------------------------------------------------------------------------------------------

--Q13. Find the maximum Total Amount spent in a single transaction.
--Expected output: Max_Total_Amount

select max(total_amount) as Max_Total_Amount
    from practicals.practical_1.retail_sales;


-----------------------------------------------------------------------------------------------------------------------

--Q14. Find the minimum Price per Unit in the dataset.
--Expected output: Min_Price_per_Unit

select min(price_per_unit) as Min_Price_per_Unit
    from practicals.practical_1.retail_sales;


-----------------------------------------------------------------------------------------------------------------------

--Q15. Find the number of transactions per Product Category.
--Expected output: Product Category, Transaction_Count

select product_category,
    count(*) as Transaction_Count
    from practicals.practical_1.retail_sales
    group by product_category;


-----------------------------------------------------------------------------------------------------------------------

--Q16. Find the total revenue (Total Amount) per gender.
--Expected output: Gender, Total_Revenue

select gender,
    sum(total_amount) as Total_Revenue
    from practicals.practical_1.retail_sales
    group by gender;



-----------------------------------------------------------------------------------------------------------------------

--Q17. Find the average Price per Unit per product category.
--Expected output: Product Category, Average_Price

select product_category,
        avg(price_per_unit) as Average_Price
    from practicals.practical_1.retail_sales
    group by product_category;

-----------------------------------------------------------------------------------------------------------------------

--Q18. Find the total revenue per product category where total revenue is greater than 10,000.
--Expected output: Product Category, Total_Revenue

select product_category,
    sum(total_amount) as Total_Revenue
    from practicals.practical_1.retail_sales
    group by product_category
    having sum(total_amount) > 10000;

-----------------------------------------------------------------------------------------------------------------------

--Q19. Find the average quantity per product category where the average is more than 2.
--Expected output: Product Category, Average_Quantity

select product_category,
    avg(quantity) as Average_Quantity
    from practicals.practical_1.retail_sales
    group by product_category
    having avg(quantity) >= 2;

-----------------------------------------------------------------------------------------------------------------------

--Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000,
--otherwise 'Low'.
--Expected output: Transaction ID, Total Amount, Spending_Level

select transaction_id,
        total_amount,

        case 
        when total_amount > 1000 then 'High'
        else 'low'
        end as Spending_Level
    from practicals.practical_1.retail_sales; 

-----------------------------------------------------------------------------------------------------------------------


--Q21. Display a new column called Age_Group that labels customers as:
--• 'Youth' if Age < 30
--• 'Adult' if Age is between 30 and 59
--• 'Senior' if Age >= 60
--Expected output: Customer ID, Age, Age_Group

select customer_id,
        age,
        case 
        when age < 30 then 'Youth'
        when age between 30 and 59 then 'Adult'
        when age >= 60 then 'Senior' 
        end as Age_Group
    from practicals.practical_1.retail_sales; 

-----------------------------------------------------------------------------------------------------------------------





