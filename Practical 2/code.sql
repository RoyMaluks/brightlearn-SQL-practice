
--NTSHEMBO MALUEKE 
--Practical 2: SQL JOIN Practice



------------------------------------------------------------------------------------------------------------------
--1. INNER JOIN: Orders with Customer and Product Names
--Question: List all orders along with the customer name and product name.
--Expected Output Columns: OrderID, OrderDate, CustomerName, ProductName, Quantity

Select 
    a.orderid,
    a.orderdate,
    b.customername,
    c.productname,
    a.quantity
from practicals.practical_2.orders as a
inner join practicals.practical_2.customers as b
    on a.customerid = b.customerid
inner join practicals.practical_2.products as c
    on a.productid = c.productid;

------------------------------------------------------------------------------------------------------------------
--2. INNER JOIN: Customers Who Placed Orders
--Question: Which customers have placed at least one order?
--Expected Output Columns:• CustomerID, CustomerName, Country, OrderID, OrderDate

Select 
    a.customerid,
    b.customername,
    b.country,
    a.orderid,
    a.orderdate,
    a.quantity
from practicals.practical_2.orders as a
inner join practicals.practical_2.customers as b
    on a.customerid = b.customerid
    where quantity > 1; 

------------------------------------------------------------------------------------------------------------------
--3. LEFT JOIN: All Customers and Their Orders
--Question: List all customers and any orders they might have placed. Include customers who have not placed any orders.
--Expected Output Columns: CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

Select 
    a.customername,
    a.country,
    b.customerid,
    b.orderid,
    b.orderdate,
    b.productid,
    b.quantity
from practicals.practical_2.customers as a
left join practicals.practical_2.orders as b
    on a.customerid = b.customerid;

------------------------------------------------------------------------------------------------------------------
--4. LEFT JOIN: Product Order Count
--Question:List all products and how many times each was ordered (if any).
--Expected Output Columns:• ProductID, ProductName, TotalOrders
--(TotalOrders is the count of how many times the product appears in orders)

Select c.productid,
       c.productname,
       count(b.orderid) as TotalOrders
from practicals.practical_2.products as c
left join practicals.practical_2.orders as b
    on c.productid = b.productid
    group by c.productid,
            c.productname;


------------------------------------------------------------------------------------------------------------------
--5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)
--Question: Find all orders along with product details, including any products that might not have been ordered.
--Expected Output Columns: • OrderID, OrderDate, ProductID, ProductName, Price, Quantity

select  b.orderID,
        b.orderDate,
        a.productID,
        a.productname,
        a.price,
        b.quantity
    from practicals.practical_2.orders as b
    right join practicals.practical_2.products as a
    on b.ProductID = a.ProductID;

------------------------------------------------------------------------------------------------------------------
--6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
--Question: Which customers have made orders, and include customers even if they have never placed an order.
--Expected Output Columns: • CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

select  a.customerid,
        b.customername,
        b.country,
        a.orderid,
        a.orderdate,
        a.productid,
        a.quantity
    from practicals.practical_2.orders as a
    right join practicals.practical_2.customers as b
    on a.customerid = b.customerid;


------------------------------------------------------------------------------------------------------------------
--7. FULL OUTER JOIN: All Customers and All Orders
--Question: List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info.
--Expected Output Columns: • CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

select  coalesce(a.customerid, b.customerid) AS customerid,
        b.customername,
        b.country,
        a.orderid,
        a.orderdate,
        a.productid,
        a.quantity
    from practicals.practical_2.orders as a
    full outer join practicals.practical_2.customers as b
    on a.customerid = b.customerid;

------------------------------------------------------------------------------------------------------------------
--8. FULL OUTER JOIN: All Products and Orders
--Question: List all products and orders, showing NULLs where products were never ordered or orders are missing product info.
--Expected Output Columns: • ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

select  coalesce(a.productid, b.productid) as productid,
        b.productname,
        b.price,
        a.orderid,
        a.orderdate,
        a.customerid,
        a.quantity
    from practicals.practical_2.orders as a
    full outer join practicals.practical_2.products as b
    on a.productid = b.productid;

------------------------------------------------------------------------------------------------------------------

