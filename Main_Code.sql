Set Serveroutput ON


------DB1 - Naveen's DB and tables----------
------DB2 - Shanthan,s DB and tables--------
------DB3 - Srinath's DB and tables---------
------DB4 - Sudhanshu's DB and tables-------

Drop SEQUENCE Item_ID;
DROP TABLE DB1_Line_Items;
DROP TABLE DB1_Orders;
DROP TABLE DB1_Product;
DROP TABLE DB1_Customers;

drop table DB2_lineitems;
drop table DB2_orders;
drop table DB2_products;
drop table DB2_customers;

drop table DB3_Line_items;
drop table DB3_Orders;
drop table DB3_Products;
drop table DB3_Customers;


drop table DB4_line_item;
drop sequence li_id;
drop table DB4_orders;
drop sequence o_ID;
drop table DB4_product;
drop sequence p_ID;
DROP TABLE DB4_customer;

drop table Meta_dat;
drop table KW;

-- Creating a sequence named Item_ID starting the ID with 101

Create Sequence Item_ID
START WITH 101
INCREMENT BY 1
NOCACHE;

-- Creating a Table Customers with Phone_NUMBER as PK

create table DB1_Customers (
Customer_Name Varchar (100) Not Null,
Address Varchar (100) Not Null,
Phone_NUMBER Number Not Null,
Email Varchar (100) Not Null,
Primary KEY (Phone_NUMBER)
);

-- Creating a Product with Product_ID as PK

create table DB1_Product (
Product_ID INT Not Null,
Name Varchar (100) Not Null,
Product_Description Varchar (100) Not Null,
Quantity Number Not Null,
Price Int Not Null,
Primary KEY (Product_ID)
);

-- Creating a Table Orders with Order_ID as PK and FK as Phone_NUMBER

create table DB1_Orders (
Order_ID INT Not Null,
Order_Date Date Not Null,
Cutomer_Name Varchar (100) Not Null,
Number_Of_Products_Ordered INT NOT NULL,
Total_Price Number Not Null,
Phone_NUMBER Number Not Null,
Primary KEY (Order_ID),
FOREIGN KEY(Phone_NUMBER) references DB1_Customers(Phone_NUMBER)
);

-- Creating a Line_Items with Item_ID as PK and FK as Product_IDs and Order_IDs

create table DB1_Line_Items(
Item_ID INT Not Null,
Product_IDs INT Not Null,
Order_IDs Int Not Null,
Description Varchar (100) Not Null,
Quantity_Ordered Int Not Null,
Price_Per_Unit Number Not Null,
Primary KEY (Item_Id),
FOREIGN KEY(Product_IDs) references DB1_Product(Product_ID),
FOREIGN KEY(Order_IDs) references DB1_Orders(Order_ID)
);

-- Inserting data into Customers table

INSERT INTO  DB1_Customers VALUES ('Nancy','123 Street A',123456789,'Nanacy1@gmail.com');
INSERT INTO  DB1_Customers VALUES ('Macy','321 Street B',325123852,'Macy1@gmail.com');
INSERT INTO  DB1_Customers VALUES ('Amy','147 Street C',145325698,'Amy1@gmail.com');
INSERT INTO  DB1_Customers VALUES ('Jeff','253 Street D',756914583,'Jeff@gmail.com');

-- Inserting data into Product table

INSERT INTO DB1_Product VALUES (1,'Keyboard','Keyboard',10,5);
INSERT INTO DB1_Product VALUES (2,'TV','Television',5,100);
INSERT INTO DB1_Product VALUES (3,'Mobile','Phone',20,10);
INSERT INTO DB1_Product VALUES (4,'Laptop','Laptop',8,150);
INSERT INTO DB1_Product VALUES (5,'Desktop','Monitor',15,50);

-- Inserting data into Orders table

INSERT INTO DB1_ORDERS VALUES (11,date'2022-12-9','Nancy', 3,25,123456789); 
INSERT INTO DB1_ORDERS VALUES (12,date'2022-8-7','Jeff', 4,410,756914583); 
INSERT INTO DB1_ORDERS VALUES (13,date'2022-1-5','Macy', 8,520,325123852); 
INSERT INTO DB1_ORDERS VALUES (14,date'2022-5-10','Amy', 3,115,756914583); 

--Inserting data into Line_Items Table

INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,1 ,11,'Keyboard',2, 5);
INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,3 ,11,'Phone',1,10);
INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,4 ,12,'Laptop',2, 300);
INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,5 ,12,'Monitor',2, 100);
INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,5 ,13,'Monitor',3, 150);
INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,4 ,13,'Laptop',1, 150);
INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,2 ,13,'Television',2, 200);
INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,1 ,14,'Keyboard',1, 5);
INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,2 ,14,'Television',1, 100);
INSERT INTO DB1_Line_Items VALUES (Item_ID.nextval,3 ,14,'Phone',1, 10);








--------------------------------------Customer table-------------------------------------------------

create table DB2_customers(
c_id int not null,
cname varchar(50),
caddress varchar(100),
pnumber int not null,
cemail varchar(100),
primary key(c_id)
);
---------------------------------------Products table----------------------------------------------

create table DB2_products(
p_id int not null,
proname varchar(50),
prodescription varchar(100),
proquantity int not null,
proprice float not null,
primary key(p_id)
);
---------------------------------------Orders table----------------------------------------------

create table DB2_orders(
o_id int not null,
odate date,
c_id int not null,
proordered int not null,
totalprice float not null,
primary key(o_id),
FOREIGN KEY(c_id) REFERENCES DB2_customers(c_id)
);
---------------------------------------Line Items table------------------------------------------

create table DB2_lineitems(
i_id int not null,
idescription varchar(100),
iquantityordered int not null,
iprice_per_unit float not null,
o_id int not null,
p_id int not null,
primary key(i_id),
FOREIGN KEY(o_id) REFERENCES DB2_orders(o_id),
FOREIGN KEY(p_id) REFERENCES DB2_products(p_id)
);
--------------------------------------inserting values in customer table----------------------------------------

insert into DB2_customers values (501, 'George', '100 Greenvile Court, 21203, MD', 987654321, 'george@gmail.com');
insert into DB2_customers values (502, 'William', '245 St Peter Drive, 41035, AZ', 765432198, 'william@gmail.com');
insert into DB2_customers values (503, 'Henry', '750 Oxford Street, 32106, NY', 543217698, 'henry@gmail.com');
insert into DB2_customers values (504, 'Jeffery', '909  Long Valley Way, 91203, NC', 321985674, 'jeffery@gmail.com');
insert into DB2_customers values (505, 'Paul', '1001 Grffindor Terrace, 12035, PA', 21983322, 'paul@gmail.com');
insert into DB2_customers values (506, 'Smith', '600 Aldgate, 20311, IL', 3546772, 'smith@gmail.com');
insert into DB2_customers values (507, 'Alex', '444 Brightdoor Corner, 21306, VA', 95554321, 'alex@gmail.com');
insert into DB2_customers values (508, 'John', '123 Fernley Street, 20003, CA', 43216690, 'john@gmail.com');
insert into DB2_customers values (509, 'Max', '591 Ranger Drive, 91203, NJ', 65432100, 'max@gmail.com');
insert into DB2_customers values (510, 'Ben', '300 Belwood, 30010, FL', 54321987, 'ben@gmail.com');

------------------------------------inserting values in products table-------------------------------------------

insert into DB2_products values (601, 'Samsung Galaxy', 'Edge ultra fast', 10, 10000);
insert into DB2_products values (602, 'One Plus', 'Nord Booster tech', 15, 15000);
insert into DB2_products values (603, 'Blackberry', 'Classic', 200, 30000);
insert into DB2_products values (604, 'Google Pixel', 'Andriod Chrome Os', 30, 50000);
insert into DB2_products values (605, 'Nexus', 'Google and huawei', 40, 40000);
insert into DB2_products values (606, 'ipod', 'flip and advanced', 25, 25000);
insert into DB2_products values (607, 'iphone', '14 Pro Max', 100, 100000);
insert into DB2_products values (608, 'Nokia', 'Lumia 610', 60, 60000);
insert into DB2_products values (609, 'Sony', 'Ericcson', 15, 9000);
insert into DB2_products values (610, 'HTC', 'flipperedge', 35, 75000);

----------------------------------------inserting values in orders table-------------------------------------------

insert into DB2_orders values (701, date '2022-12-01', 505, 5, 1000);
insert into DB2_orders values (702, date '2022-02-10', 501, 1, 5000);
insert into DB2_orders values (703, date '2022-10-16', 505, 5, 999);
insert into DB2_orders values (704, date '2022-09-25', 510, 2, 7000);
insert into DB2_orders values (705, date '2022-04-15', 509, 3, 1500);
insert into DB2_orders values (706, date '2022-12-22', 505, 5, 3000);
insert into DB2_orders values (707, date '2022-09-11', 505, 9, 9000);
insert into DB2_orders values (708, date '2022-06-21', 508, 6, 5500);
insert into DB2_orders values (709, date '2022-08-15', 501, 7, 1000);
insert into DB2_orders values (710, date '2022-12-01', 505, 6, 2000);

-------------------------------------------inserting values in Line items table---------------------------------------

insert into DB2_lineitems values (801, 'HTC', 1, 100, 701, 610);
insert into DB2_lineitems values (802, 'Nexus', 2, 300, 701, 605);
insert into DB2_lineitems values (803, 'Nokia', 3, 400, 703, 608);
insert into DB2_lineitems values (804, 'iphone', 4, 5000, 704, 607);
insert into DB2_lineitems values (805, 'Nexus', 5, 6000, 705, 605);
insert into DB2_lineitems values (806, 'Nexus', 6, 7000, 701, 605);
insert into DB2_lineitems values (807, 'Google Pixel', 7, 8000, 707, 604);
insert into DB2_lineitems values (808, 'iphone', 8, 9000, 708, 607);
insert into DB2_lineitems values (809, 'Nexus', 9, 5000, 709, 605);
insert into DB2_lineitems values (810, 'Samsung Galaxy', 5, 4000, 701, 601);





-- Table creations starts---
create table DB3_customers
(custID int,
custNAME varchar(100),
phoneNUMBER varchar(20),
custADDRESS varchar(200),
emailID varchar(100),
primary key(custID));
/
create table DB3_products
(productID int,
productNAME varchar(200),
productDSPT  varchar (500),
productQTY  int,
productPRICE float,
primary key(productID));
/
create table DB3_orders
(orderID int,
custID int,
orderDATE date, 
totalPRICE float,
primary key(orderID),
foreign key(custID) references DB3_customers(custID));
/
create table DB3_line_items 
(lineID int,
orderID int,
productID int,
PRICEperUNIT float,
ORDERquantity  int,
primary key(lineID),
foreign key(orderID) references DB3_orders(orderID),
foreign key(productID) references DB3_products(productID));
/
---Insertion of data into the tables created above starts here

insert into DB3_customers values(801,'Dwayne Johnson','8888877777','4541 DJ STREET 22215,NY,USA','DJ@GMAIL.COM');
insert into DB3_customers values(802,'Johnny Depp','6666611111','5151 JD STREET 24651,TX,USA','JD@GMAIL.COM');
insert into DB3_customers values(803,'Robert Downey Jr','4444456561','3547 RDJ STREET 54758,MD,USA','RDJ@GMAIL.COM');
insert into DB3_customers values(804,'Leonardo Dicaprio','8546823567','5486 LD STREET 45698,PA,USA','LD@GMAIL.COM');
insert into DB3_customers values(805,'Vin Diesel','4566822449','4758 VD STREET 85265, TX,USA','VD@GMAIL.COM');
insert into DB3_customers values(806,'Chris Evans','4466844225','6852 CE STREET 55445,NC,USA','CE@GMAIL.COM');
insert into DB3_customers values(807,'Henry Cavill','7755911446','4578 HC STREET 57865,NC,USA','HC@GMAIL.COM');
insert into DB3_customers values(808,'Chris Hemsworth','7755422335','5684 CH STREET 45789,MD,USA','CH@GMAIL.COM');
insert into DB3_customers values(809,'Tom Cruise','4455755886','5471 TC STREET 57954,LA,USA','TC@GMAIL.COM');
insert into DB3_customers values(810,'Hugh Jackman','5511224466','7854 HJ STREET 45789,VA,USA','HJ@GMAIL.COM');
/
insert into DB3_products values(1024,'smart watch','auto connects',17,350);
insert into DB3_products values(4574,'neck massager','realxation kit',25,124);
insert into DB3_products values(1254,'ice skates','ice sports',14,200);
insert into DB3_products values(1244,'car phone holder','safe guard',8,22);
insert into DB3_products values(6854,'doormats','decoraters',4,56);
insert into DB3_products values(4578,'swim suit','swim wear',54,145);
insert into DB3_products values(7895,'laptop','dell',24,856);
insert into DB3_products values(5425,'socks','US polo',44,16);
insert into DB3_products values(4545,'gloves','US polo',66,12);
insert into DB3_products values(2323,'Hiking Backpacks','Spring products',6,100);
/
insert into DB3_orders values(401,801,date '2022-09-10',674);
insert into DB3_orders values(402,809,date '2022-09-12',248);
insert into DB3_orders values(403,804,date '2022-09-12',22);
insert into DB3_orders values(404,802,date '2022-09-14',1712);
insert into DB3_orders values(405,801,date '2022-09-15',290);
insert into DB3_orders values(406,807,date '2022-09-17',16);
insert into DB3_orders values(407,807,date '2022-09-17',100);
insert into DB3_orders values(408,809,date '2022-09-19',12);
insert into DB3_orders values(409,810,date '2022-09-21',56);
insert into DB3_orders values(410,806,date '2022-09-21',100);
/

insert into DB3_line_items values(1,401,1024,350,1);
insert into DB3_line_items values(2,401,4574,124,1);
insert into DB3_line_items values(3,401,1254,200,1);
insert into DB3_line_items values(4,402,4574,124,2);
insert into DB3_line_items values(5,403,1244,22,1);
insert into DB3_line_items values(6,404,7895,856,2);
insert into DB3_line_items values(7,405,4578,145,2);
insert into DB3_line_items values(9,406,5425,16,1);
insert into DB3_line_items values(10,407,2323,100,1);
insert into DB3_line_items values(11,408,4545,12,1);
insert into DB3_line_items values(12,409,6854,56,1);
insert into DB3_line_items values(13,410,2323,100,1);




-------------creating and inserting ---------------------
CREATE TABLE DB4_customer (
	cphone         INT NOT NULL,
    cname          VARCHAR(50) NOT NULL,
    caddress       VARCHAR(50) NOT NULL,
    cemail         VARCHAR(50) NOT NULL,
    PRIMARY KEY (cphone)
);

insert into DB4_customer values
(9643663793,'Sam','219 Maple St.','sam@gmail.com');
insert into DB4_customer values
(9999888878,'Raj','213 County St.','raj@gmail.com');
insert into DB4_customer values
(8888999995,'Que','720 Fan St.','que@gmail.com');
insert into DB4_customer values
(9977885544,'Fan','230 Queen St.','fan@gmail.com');
insert into DB4_customer values
(9977885487,'Sun','230 Maple St.','sun@gmail.com');
insert into DB4_customer values
(9977887854,'Ham','720 Queen St.','ham@gmail.com');
insert into DB4_customer values
(9977815415,'Lon','219 Queen St.','lon@gmail.com');


create sequence p_id start with 100;


create table DB4_product(
pID             int NOT NULL,
pName           varchar(15) NOT NULL,
pDiscription    varchar(50),
pquantity       int NOT NULL,
pprice          int NOT NULL,
PRIMARY KEY (pID))
;
insert into DB4_product values
(p_id.nextval,'mouse','input device',70,10);
insert into DB4_product values
(p_id.nextval,'keyboard','input device',80,15);
insert into DB4_product values
(p_id.nextval,'monitor','output device',50,30);
insert into DB4_product values
(p_id.nextval,'joystick','input device',100,25);
insert into DB4_product values
(p_id.nextval,'usb','storage',150,5);
insert into DB4_product values
(p_id.nextval,'printer','output device',30,50);
insert into DB4_product values
(p_id.nextval,'scanner','input device',20,40);


create sequence o_id start with 1000;


create table DB4_orders(
oid     int NOT NULL,
cphone  int NOT NULL,
odate   date,
nofpro  int NOT NULL,
cname   varchar(50),
amount  float NOT NULL,
PRIMARY KEY (oID),
FOREIGN KEY(cphone) REFERENCES DB4_Customer(cphone));

insert into DB4_orders values
(o_id.nextval,9643663793,date'2022-12-9',5,'Sam',65);
insert into DB4_orders values
(o_id.nextval,9999888878,date'2021-4-30',15,'Raj',505);
insert into DB4_orders values
(o_id.nextval,9977885544,date'2022-7-22',2,'Fan',20);
insert into DB4_orders values
(o_id.nextval,9977885487,date'2021-3-21',1,'Sun',5);
insert into DB4_orders values
(o_id.nextval,9977885544,date'2022-2-23',12,'Fan',200);
insert into DB4_orders values
(o_id.nextval,9977885487,date'2021-3-2',5,'Sun',180);
 
 


create sequence li_id start with 100000;


create table DB4_line_item(
liID    int NOT NULL,
oid     int NOT NULL,
pid     int NOT NULL,
pprice  int NOT NULL,
nofunit int NOT NULL,
PRIMARY KEY (liID),
FOREIGN KEY(oid) REFERENCES DB4_orders(oid),
FOREIGN KEY(pid) REFERENCES DB4_product(pid))
;

insert into DB4_line_item values
(li_id.nextval,1000,101,15,3);
insert into DB4_line_item values
(li_id.nextval,1000,100,10,2);
insert into DB4_line_item values
(li_id.nextval,1001,102,30,10);
insert into DB4_line_item values
(li_id.nextval,1001,105,50,4);
insert into DB4_line_item values
(li_id.nextval,1001,104,5,1);
insert into DB4_line_item values
(li_id.nextval,1002,100,10,2);
insert into DB4_line_item values
(li_id.nextval,1003,104,5,1);
insert into DB4_line_item values
(li_id.nextval,1004,103,25,4);
insert into DB4_line_item values
(li_id.nextval,1004,101,15,4);
insert into DB4_line_item values
(li_id.nextval,1004,100,10,4);
insert into DB4_line_item values
(li_id.nextval,1005,102,10,3);
insert into DB4_line_item values
(li_id.nextval,1005,105,10,1);
insert into DB4_line_item values
(li_id.nextval,1005,106,10,1);







-----------Creating Meta Data Table-------------------------
create table Meta_dat(
Global_rep varchar(50), ------Global representation of the combine databases-------
Col_DB1 varchar(50), --------------Column/Attribute/content name in DB1---------
data_type_DB1 varchar(50), ---datatype in database 1 of the above attribute/content---
mapping_DB1 varchar(50), ---------mapping between database 1 and global ------------
Col_DB2 varchar(50), --------------Column/Attribute/content name in DB2---------
data_type_DB2 varchar(50), ---datatype in database 2 of the above attribute/content---
mapping_DB2 varchar(50), ---------mapping between database 2 and global ------------
Col_DB3 varchar(50), --------------Column/Attribute/content name in DB3---------
data_type_DB3 varchar(50), ---datatype in database 3 of the above attribute/content---
mapping_DB3 varchar(50), ---------mapping between database 3 and global ------------
Col_DB4 varchar(50), --------------Column/Attribute/content name in DB4---------
data_type_DB4 varchar(50), ---datatype in database 4 of the above attribute/content---
mapping_DB4 varchar(50), ---------mapping between database 4 and global ------------
Primary Key (Global_rep) ---------PRIMARY KEY = Global Representation---------------
);
-----------------inserting Meta Data in metadata table-------------------------------
------------inserting table = Customer and corresponding names in different DBs -----
insert into Meta_dat VALUES
('customers','DB1_Customers','Table','DB1_Customers','DB2_Customers','Table','DB2_Customers','DB3_Customers','Table','DB3_Customers','DB4_Customer','Table','DB4_Customer');
------------inserting table = products and corresponding names in different DBs -----
insert into Meta_dat VALUES
('products','DB1_Product','Table','DB1_Product','DB2_Products','Table','DB2_Products','DB3_Products','Table','DB3_Products','DB4_Product','Table','DB4_Product');
------------inserting table = orders and corresponding names in different DBs -------
insert into Meta_dat VALUES
('orders','DB1_Orders','Table','DB1_Orders','DB2_Orders','Table','DB2_Orders','DB3_Orders','Table','DB3_Orders','DB4_Orders','Table','DB4_Orders');
------------inserting table = lineItems and corresponding names in different DBs ----
insert into Meta_dat VALUES
('lineItems','DB1_Line_Items','Table','DB1_Line_Items','DB2_lineItems','Table','DB2_lineItems','DB3_line_Items','Table','DB3_line_Items','DB4_lineItems','Table','DB4_lineItems');
------------------------inserting customers attributes meta data-------------------------------
------------inserting table = Customers attribute = customerID and corresponding names in different DBs ---------
insert into Meta_dat VALUES
('customerID',NULL,NULL,NULL,'C_ID','int','C_ID','custID','int','custID',NULL,NULL,NULL);
------------inserting table = Customers and attribute = customerName and corresponding names in different DBs -------
insert into Meta_dat VALUES
('customerName','Customer_Name','varchar','Customer_Name','cname','varchar','cname','custname','varchar','custname','cname','varchar','cname');
------------inserting table = Customers and attribute = customerAddress and corresponding names in different DBs ----
insert into Meta_dat VALUES
('customerAddress','Address','varchar','Address','caddress','varchar','caddress','custaddress','varchar','custaddress','caddress','varchar','caddress');
------------inserting table = Customers and attribute = customerPhone and corresponding names in different DBs -----
insert into Meta_dat VALUES
('customerPhone','phone_number','number','phone_number','pnumber','int','pnumber','phonenumber','varchar','phonenumber','cphone','int','cphone');
------------------------inserting attributes meta data-------------------------------
insert into Meta_dat VALUES
('customerEmail','email','varchar','email','cemail','varchar','cemail','emailID','varchar','emailID','cemail','varchar','cemail');
------------------------inserting attributes meta data-------------------------------
------------inserting table = orders attribute = orderID and corresponding names in different DBs ----
insert into Meta_dat VALUES
('orderID','order_ID','int','order_ID','o_ID','int','o_ID','orderID','INT','orderID','oid','int','oid');
------------inserting table = orders attribute = orderDate and corresponding names in different DBs ----
insert into Meta_dat VALUES
('orderDate','order_Date','Date','order_Date','odate','Date','odate','orderDate','Date','orderDate','odate','date','odate');
------------inserting table = orders attribute = orderNop(No of products) and corresponding names in different DBs ----
insert into Meta_dat VALUES
('orderNop','number_of_products_order','number','number_of_products_order','proordered','int','proordered',NULL,NULL,
NULL,'nofpro','int','nofpro');
------------inserting table = orders attribute = orderAmount and corresponding names in different DBs ----
insert into Meta_dat VALUES
('orderAmount','total_price','number','total_price','totalprice','float','totalprice','totalprice','float','totalprice','amount','float','amount');
------------inserting table = products attribute = productID and corresponding names in different DBs ----
insert into Meta_dat VALUES
('productID','product_ID','int','product_ID','p_ID','int','p_ID','productID','int','productID','pid','int','pid');
------------inserting table = products attribute = productName and corresponding names in different DBs ----
insert into Meta_dat VALUES
('productName','Name','varchar','Name','proname','varchar','proname','productNAME','varchar','productNAME','pname','varchar','pname');
------------inserting table = products aatribute = productDescription and corresponding names in different DBs ---
insert into Meta_dat VALUES
('productDescription','product_Description','varchar','product_Description','prodescription','varchar','prodescription','productDSPT','varchar','productDSPT','pdescription','varchar','pdescription');
------------inserting table = products attribute = productQuantity and corresponding names in different DBs ----
insert into Meta_dat VALUES
('productQuantity','Quantity','number','Quantity','proquantity','int','proquantity','productQTY','int','productQTY','pquantity','int','pquantity');
------------inserting table = products attribute = productPrice and corresponding names in different DBs ----
insert into Meta_dat VALUES
('productPrice','price','int','price','proprice','float','proprice','productprice','float','productprice','pprice','int','pprice');
------------inserting table = lineItems attribute = itemID and corresponding names in different DBs ----
insert into Meta_dat VALUES
('itemID','Item_ID','int','Item_ID','i_ID','int','i_ID','lineID','int','lineID','li_d','int','li_id');
------------inserting table = lineItems attribute = itemDescription and corresponding names in different DBs ----
insert into Meta_dat VALUES
('itemDescription','Description','varchar','Description','i_description','varchar','i_description',NULL,NULL,NULL,NULL,NULL,NULL);
------------inserting table = lineItems attribute = itemQuantity and corresponding names in different DBs ----
insert into Meta_dat VALUES
('itemQuantity','Quantity_Ordered','int','Quantity_Ordered','iquantityordered','int','iquantityordered','ORDERquantity','int','ORDERquantity','nofunit','int','nofunit');
------------inserting table = lineItems attribute = productIDs and corresponding names in different DBs ----
insert into Meta_dat VALUES
('productIDs','product_IDs','int','product_IDs','p_ID','int','p_ID','productID','int','productID','pid','int','pid');
------------inserting table = lineItems attributes = orderIDs and corresponding names in different DBs ----
insert into Meta_dat VALUES
('orderIDs','order_IDs','int','order_IDs','o_ID','int','o_ID','orderID','INT','orderID','oid','int','oid');
------------inserting table = lineItems attributes =priceperUnits and corresponding names in different DBs ----
insert into Meta_dat VALUES
('priceperUnits','Price_Per_Unit','Number','Price_Per_Unit','iprice_per_unit','Float','iprice_per_unit','PRICEperUNIT','Float','PRICEperUNIT','
pprice','INT','pprice');
--command to show the data inserted in to the Meta_dat table
/
-- creating KW table
create table KW 
(
Keyword varchar(50),
Primary Key(Keyword)
);
--insertion of data into the KW table
insert into KW values ('SELECT');
insert into KW values ('FROM');
insert into KW values ('*');
insert into KW values ('WHERE');
insert into KW values ('HAVING');
insert into KW values ('GROUP');
insert into KW values ('BY');

/
--this function used to fetch a keyword from kw table
create or replace function KeyW(str1 varchar2)
return int
IS 
v1 varchar2(1000);
Begin 
Select keyword into v1 from KW where keyword = str1;
if 
v1 = str1 then
return 1;
else 
return 0;
end if;
exception when no_data_found then
return 0;
end;
/
--this function is used to check attributes from the Meta_dat table
create or replace function atri(str2 varchar2)
return int
IS 
v2 varchar2(1000);
Begin 
Select Global_Rep into v2 from Meta_Dat where Global_rep = str2;
if 
v2 = str2 then
return 1;
else 
return 0;
end if;
exception when no_data_found then
return 0;
end;
/
--this function used for mapping from DB1
create or replace function atriDB1(str2 varchar2)
return varchar2
IS 
v3 varchar(50);
v4 varchar(100);
Begin
v4 := 'No mapping for this attribute or table in DB1';
Select mapping_db1 into v3 from Meta_Dat where Global_rep = str2;
return v3;
exception when no_data_found then
return v4;
end;
/
--this function used for mapping from DB2
create or replace function atriDB2(str2 varchar2)
return varchar2
IS 
v5 varchar2(1000);
v6 varchar2(1000);
Begin
v6 := 'No mapping for this attribute or table in DB1';
Select mapping_db2 into v5 from Meta_Dat where Global_rep = str2;
return v5;
exception when no_data_found then
return v6;
end;
/
--this function used for mapping from DB3
create or replace function atriDB3(str2 varchar2)
return varchar2
IS 
v7 varchar2(1000);
v8 varchar2(1000);
Begin
v8 := 'No mapping for this attribute or table in DB1';
Select mapping_db3 into v7 from Meta_Dat where Global_rep = str2;
return v7;
exception when no_data_found then
return v8;
end;
/
--this function used for mapping from DB4
create or replace function atriDB4(str2 varchar2)
return varchar2
IS 
v9 varchar2(1000);
v10 varchar2(1000);
Begin
v10 := 'No mapping for this attribute or table in DB1';
Select mapping_db4 into v9 from Meta_Dat where Global_rep = str2;
return v9;
exception when no_data_found then
return v10;
end;
/
create or replace function tokeniza1(str varchar2)
return varchar2
AS
c1_length number(20);--string length calculation purpose
c4 int(10);
c2 varchar2(1000);
c3 varchar2(1000);
c5 int(10);
c6 int(10);
c7 varchar2(1000);
c8 varchar2(1000);
c9 varchar2(1000);
c10 varchar2(1000);
str1 varchar2(1000);
str2 varchar2(1000);
str3 varchar2(1000);
str4 varchar2(1000);
i number(20);
j number(20);
--w varchar(99);
Begin
str1 := '';
str2 := '';
str3 := '';
str4 := '';
--c2:='Select Global_rep,Col_DB1,sum(sal) from Meta_dat';
c1_length:=length(str);
--dbms_output.put_line(c1_length);
--dbms_output.put_line(str);
--for i IN 1..c1_length
i:=1;
while i<=c1_length
loop
c3:=REGEXP_SUBSTR (str, '[^, ().=+-;]+',i);
--for j IN 1..c1_length
c2:=REGEXP_SUBSTR(str, '[() .=+-:]',i,1);
--dbms_output.put_line(c2);
--dbms_output.put_line(c3);
c5 := KeyW(c3);
c6 := atri(c3);
If c5 = 1 then--it is calling a keyword function 
str1 := str1 || c3 || c2;
str2 := str2 || c3 || c2;
str3 := str3 || c3 || c2;
str4 := str4 || c3 || c2;
--dbms_output.put_line(c3 || ' is a keyword');
elsif c6 = 1 then
c7 := atriDB1(c3);--c7 is calling atriDB1
str1:= str1 || c7 || c2;
c8 := atriDB2(c3);--c8 is calling atriDB2
str2:= str2 || c8 || c2;
c9 := atriDB3(c3);--c9 is calling atriDB3
str3:= str3 || c9 || c2;
c10 := atriDB4(c3);--c10 is calling atriDB4
str4:= str4 || c10  || c2;
--dbms_output.put_line(c3 || ' is a attribute or table Mapping with DB1 : ' || c7 ||' Mapping with DB2 : ' || c8 || ' Mapping with DB3 : '|| c9 || ' Mapping with DB4 : ' || c10);
else 
dbms_output.put_line('Please check this word in the Query');
end if ;
c4:= length(c3);
i:=i+c4+1;
end loop;
--w := 'create table temp1 AS (' || str1 || ')';
--execute IMMEDIATE (w);
return str1;
end;
/
/
create or replace function tokeniza2(str varchar2)
return varchar2
AS
c1_length number(20);--string length calculation purpose
c4 int(10);
c2 varchar2(1000);
c3 varchar2(1000);
c5 int(10);
c6 int(10);
c7 varchar2(1000);
c8 varchar2(1000);
c9 varchar2(1000);
c10 varchar2(1000);
str1 varchar2(1000);
str2 varchar2(1000);
str3 varchar2(1000);
str4 varchar2(1000);
i number(20);
j number(20);
--w varchar(99);
Begin
str1 := '';
str2 := '';
str3 := '';
str4 := '';
--c2:='Select Global_rep,Col_DB1,sum(sal) from Meta_dat';
c1_length:=length(str);
--dbms_output.put_line(c1_length);
--dbms_output.put_line(str);
--for i IN 1..c1_length
i:=1;
while i<=c1_length
loop
c3:=REGEXP_SUBSTR (str, '[^, ().=+-;]+',i);
--for j IN 1..c1_length
c2:=REGEXP_SUBSTR(str, '[() .=+-:]',i,1);
--dbms_output.put_line(c2);
--dbms_output.put_line(c3);
c5 := KeyW(c3);
c6 := atri(c3);
If c5 = 1 then--it is calling a keyword function 
str1 := str1 || c3 || c2;
str2 := str2 || c3 || c2;
str3 := str3 || c3 || c2;
str4 := str4 || c3 || c2;
--dbms_output.put_line(c3 || ' is a keyword');
elsif c6 = 1 then
c7 := atriDB1(c3);--c7 is calling atriDB1
str1:= str1 || c7 || c2;
c8 := atriDB2(c3);--c8 is calling atriDB2
str2:= str2 || c8 || c2;
c9 := atriDB3(c3);--c9 is calling atriDB3
str3:= str3 || c9 || c2;
c10 := atriDB4(c3);--c10 is calling atriDB4
str4:= str4 || c10  || c2;
--dbms_output.put_line(c3 || ' is a attribute or table Mapping with DB1 : ' || c7 ||' Mapping with DB2 : ' || c8 || ' Mapping with DB3 : '|| c9 || ' Mapping with DB4 : ' || c10);
else 
dbms_output.put_line('Please check this word in the Query');
end if ;
c4:= length(c3);
i:=i+c4+1;
end loop;
return str2;
end;
/
/
create or replace function tokeniza3(str varchar2)
return varchar2
AS
c1_length number(20);--string length calculation purpose
c4 int(10);
c2 varchar2(1000);
c3 varchar2(1000);
c5 int(10);
c6 int(10);
c7 varchar2(1000);
c8 varchar2(1000);
c9 varchar2(1000);
c10 varchar2(1000);
str1 varchar2(1000);
str2 varchar2(1000);
str3 varchar2(1000);
str4 varchar2(1000);
i number(20);
j number(20);
--w varchar(99);
Begin
str1 := '';
str2 := '';
str3 := '';
str4 := '';
--c2:='Select Global_rep,Col_DB1,sum(sal) from Meta_dat';
c1_length:=length(str);
--dbms_output.put_line(c1_length);
--dbms_output.put_line(str);
--for i IN 1..c1_length
i:=1;
while i<=c1_length
loop
c3:=REGEXP_SUBSTR (str, '[^, ().=+-;]+',i);
--for j IN 1..c1_length
c2:=REGEXP_SUBSTR(str, '[() .=+-:]',i,1);
--dbms_output.put_line(c2);
--dbms_output.put_line(c3);
c5 := KeyW(c3);
c6 := atri(c3);
If c5 = 1 then--it is calling a keyword function 
str1 := str1 || c3 || c2;
str2 := str2 || c3 || c2;
str3 := str3 || c3 || c2;
str4 := str4 || c3 || c2;
--dbms_output.put_line(c3 || ' is a keyword');
elsif c6 = 1 then
c7 := atriDB1(c3);--c7 is calling atriDB1
str1:= str1 || c7 || c2;
c8 := atriDB2(c3);--c8 is calling atriDB2
str2:= str2 || c8 || c2;
c9 := atriDB3(c3);--c9 is calling atriDB3
str3:= str3 || c9 || c2;
c10 := atriDB4(c3);--c10 is calling atriDB4
str4:= str4 || c10  || c2;
--dbms_output.put_line(c3 || ' is a attribute or table Mapping with DB1 : ' || c7 ||' Mapping with DB2 : ' || c8 || ' Mapping with DB3 : '|| c9 || ' Mapping with DB4 : ' || c10);
else 
dbms_output.put_line('Please check this word in the Query');
end if ;
c4:= length(c3);
i:=i+c4+1;
end loop;
return str3;
end;
/
/
create or replace function tokeniza4(str varchar2)
return varchar2
AS
c1_length number(20);--string length calculation purpose
c4 int(10);
c2 varchar2(1000);
c3 varchar2(1000);
c5 int(10);
c6 int(10);
c7 varchar2(1000);
c8 varchar2(1000);
c9 varchar2(1000);
c10 varchar2(1000);
str1 varchar2(1000);
str2 varchar2(1000);
str3 varchar2(1000);
str4 varchar2(1000);
i number(20);
j number(20);
--w varchar(99);
Begin
str1 := '';
str2 := '';
str3 := '';
str4 := '';
--c2:='Select Global_rep,Col_DB1,sum(sal) from Meta_dat';
c1_length:=length(str);
--dbms_output.put_line(c1_length);
--dbms_output.put_line(str);
--for i IN 1..c1_length
i:=1;
while i<=c1_length
loop
c3:=REGEXP_SUBSTR (str, '[^, ().=+-;]+',i);
--for j IN 1..c1_length
c2:=REGEXP_SUBSTR(str, '[() .=+-:]',i,1);
--dbms_output.put_line(c2);
--dbms_output.put_line(c3);
c5 := KeyW(c3);
c6 := atri(c3);
If c5 = 1 then--it is calling a keyword function 
str1 := str1 || c3 || c2;
str2 := str2 || c3 || c2;
str3 := str3 || c3 || c2;
str4 := str4 || c3 || c2;
--dbms_output.put_line(c3 || ' is a keyword');
elsif c6 = 1 then
c7 := atriDB1(c3);--c7 is calling atriDB1
str1:= str1 || c7 || c2;
c8 := atriDB2(c3);--c8 is calling atriDB2
str2:= str2 || c8 || c2;
c9 := atriDB3(c3);--c9 is calling atriDB3
str3:= str3 || c9 || c2;
c10 := atriDB4(c3);--c10 is calling atriDB4
str4:= str4 || c10  || c2;
--dbms_output.put_line(c3 || ' is a attribute or table Mapping with DB1 : ' || c7 ||' Mapping with DB2 : ' || c8 || ' Mapping with DB3 : '|| c9 || ' Mapping with DB4 : ' || c10);
else 
dbms_output.put_line('Please check this word in the Query');
end if ;
c4:= length(c3);
i:=i+c4+1;
end loop;
--w := 'create table temp4 AS (' || str4 || ')';
--execute IMMEDIATE (w);
return str4;
end;
/
/
create or replace procedure printingstr_creatingtable(str varchar2)
AS 
w1 varchar2(1000);
w2 varchar2(1000);
w3 varchar2(1000);
w4 varchar2(1000);
w5 varchar2(1000);
w6 varchar2(1000);
w7 varchar2(1000);
w8 varchar2(1000);
w9 varchar2(1000);
Begin
execute immediate('drop table temp1');
execute immediate('drop table temp2');
execute immediate('drop table temp3');
execute immediate('drop table temp4');
w1 := tokeniza1(str);
w2 := tokeniza2(str);
w3 := tokeniza3(str);
w4 := tokeniza4(str);
dbms_output.put_line(w1);
dbms_output.put_line(w2);
dbms_output.put_line(w3);
dbms_output.put_line(w4);
w8 := concat('create table temp1 AS ' ,w1);
w5 := concat('create table temp2 AS ' ,w2);
w6 := concat('create table temp3 AS ' ,w3);
w7 := concat('create table temp4 AS ' ,w4);
execute immediate w8;
execute immediate w5;
execute immediate w6;
execute immediate w7;
w9 := 'create table finalres as ' || w1 ||' UNION ' || w2 || ' UNION ' || w3 ||' UNION ' ||w4;
dbms_output.put_line(w9);
execute immediate w9;
end;
/
exec printingstr_creatingtable('SELECT customerPhone,customerName,customerAddress FROM customers;');
select * from temp1;
select * from temp2;
select * from temp3;
select * from temp4;
select * from finalres;


create table cons AS select * from temp1
UNION
select * from temp2
UNION
select * from temp3
UNION
select * from temp4;



drop table temp1;
drop table temp2;
drop table temp3;
drop table temp4;





