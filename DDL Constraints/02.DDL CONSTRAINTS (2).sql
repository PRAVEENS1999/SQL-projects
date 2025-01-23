-- CREATING A DATABASE
CREATE DATABASE Sales;

USE Sales;

-- CREATING TABLE
CREATE TABLE Orders (
Order_ID int primary key not null unique,
Customer_name varchar (50) not null,
Product_Category varchar (50) not null,
Ordered_Item varchar (50) not null,
Contact_Number varchar (15) not null
);

# ADDING NEW COLUMN 
alter table Orders
add Order_Quantity int not null;

# RENAMING THE TABLE ORDERS
rename table Orders to Sales_Orders_table;

 -- INSERTING DATA INTO SALES_ORDERS_TABLE
 insert into Sales_Orders_table(Order_ID,Customer_name,Product_Category,
 Ordered_item,Contact_Number,Order_Quantity) 
 values
 (1001,'Robert Downey','Electonics','Smart phone','9876540000',2),
 (1002,'Chris Evans','Electonics','Camera','9123456789',1),
 (1003,'Chris Hemsworth','Furniture','Computer Chair','8795460000',1),
 (1004,'Mark Ruffalo','Clothing','Shoe','9988775500',3),
 (1005,'Scarlett Johansson','Electronics','Smart phone','8765432165',1),
 (1006,'Jeremy Renner','Clothing','T-shirt','6549210000',5),
 (1007,'Tom Holland','Furniture','Book shelf','8765487994',2),
 (1008,'Brie Larson','Electonics','Camera','8899002277',1),
 (1009,'Evangeline Lilly','Clothing','Track Suit','9876123589',6),
 (1010,'Benedict Cumberbatch','Electonics','Smart phone','6789652340',1);
 
-- RETRIVING CUSTOMER NAME AND ORDERED ITEM FROM TABLE
select Customer_Name,Ordered_Item from Sales_Orders_Table;

-- UPDATE THE PRODUCT NAME
update Sales_Orders_table
set Ordered_Item = 'Laptop'
Where Order_ID = 1005;

select * from Sales_Orders_table;

-- DELETING THE TABLE
drop table Sales_Orders_table;
 
 