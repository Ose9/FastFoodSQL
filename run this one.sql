/*WELCOME TO OUR START_UP OF FASTFOOD*/
/*Creating new database to maintain hygiene.*/
create database fastfood;
use fastfood;

/*Kirti - Grocery*/
/*Create command must be first for table*/
create table grocery
(itemId int ,itemname char ,brand varchar(30),price int ,
quantity int,primary key(itemId));

alter table grocery
modify itemname char not null; 

alter table grocery
modify itemname varchar(30); 

alter table grocery
add column units varchar(10);

/*Second must be to insert data. Write it below create, helps in reading column 
names.Saves time.*/
insert into grocery
(itemId, itemname, brand, price, quantity, units)
values
(1, 'bread','ideal',30, 100,'packet'),
(2,'milk', 'amul', 60, 15, 'lits'),
(3, 'cheese',  'amul', 15, 30,'cubes'),
(4, 'eggs',  'farm', 8, 5, 'kg');

insert into grocery
(itemId, itemname, brand, price, quantity, units)
values
(5, 'oil', 'sunflower', 90, 5, 'ltrs'),
(6, 'salt',  'tata salt', 0, 1, 'kg'),
(7, 'mineral water','bisleri', 20, 2, 'boxes'),
(8, 'flour','aashirwad', 92, 5, 'kg');

update grocery sest price = 90 where itemId=6;

select sum(price*quantity) as grocerytotal from grocery;

/*Third must be to check if everything's as per your will.*/
desc grocery;
select * from grocery;


create table initialinvestment
(itemId int, itemname varchar(150), quantity int, price int, primary key(itemId));

desc initialinvestment;

insert into initialinvestment
(itemId, itemname, price, quantity)
values
(1, 'tables', 3000, 4),
(2, 'chairs', 1500, 12),
(3, 'card swiping machine', 9000, 1),
(4, 'cctv', 5000, 4),
(5, 'computer', 1800, 2),
(6, 'billing machine', 9999, 2),
(7, ' cutlery', 1611, 3),
(8, 'crockery', 799, 4),
(9, 'gas stoves', 2099, 2),
(10, 'lights', 400, 5),
(11, 'fans', 699, 5);

select sum(price) as FinanceUs from initialinvestment;


/*Sanket - EmployeeInfo*/
Create Table EmployeeInfo (
EmployeeId int not null,
Name varchar(70) not null,
Gender varchar(30),
Contact varchar(20),
Address varchar(250),
Salary int not null,
DOB date,
Designation varchar(80) not null,
primary key(EmployeeId)
);

desc employeeinfo;

Insert into employeeinfo
(EmployeeID, Name, Gender, contact, address, salary, dob, Designation)
values
(1, 'Satish Kumar', 'M', '9850150964', 'Kondhwa, Pune', 30000, '1990-02-28', 'CEO'),
(2, 'Ravi Malhotra', 'M', '9850163478', 'Hadapsar, Pune', 27500, '1991-02-19', 'Manager'),
(3, 'Alia Arora', 'F', '9154871235', 'Hadapsar, Pune', 26000, '1991-03-30', 'Head chef'),
(4, 'Anita Singh', 'F', '9847850964', 'Saswad, Pune', 7000, '1992-02-15', 'Cashier'),
(5, 'Ravi Sharma', 'M', '6658974234', 'Kondhwa, Pune',21000 , '1992-12-02', ' Chef'),                                 
(6, 'Varu lokhande', 'M', '8938740228', 'Katraj, Pune', 21000, '1992-04-01', 'Chef'),
(7, 'Raju Shinde', 'M', '9978542336', 'Shivajinagar, Pune', 3500, '1981-09-15', 'Cleaning staff'),                           
(8, 'Anush Shinde', 'M', '8793142336', 'Undri, Pune', 7000, '1989-09-21', 'Security'),
(9, 'Bhavesh Prajapati', 'M', '9178321536', 'Kothrud, Pune', 5000, '1995-07-16', 'Delivery boy'),
(10, 'Ajay', 'M', '7018842336', 'Balewadi, Pune', 5000, '1990-06-15', 'Delivery boy');


select sum(salary) from employeeinfo;

/*Shri Monthly budget*/
create table monthlyBill
(Expid int, Service varchar(100), Amount int, DateofPayment date, ModeofPayment varchar(100));
insert into monthlyBill
values (1, 'rent', 15000, '2021-04-22', 'googlepay'),
(2, 'electricity', 5000, '2021-04-13', 'paytm'),
(3, 'Wifi+broadband', 700, '2021-04-17', 'paypal'),
(4, 'daily grocery', 4390, '2021-04-28', 'cash'),
(5, 'salary' , 153000, '2021-4-29',  'paypal'),
(6, 'water', 500, '2021-04-25', 'cash'),
(7, 'advertisement', 2480, '2021-04-27','paytm'),
(8, 'subsciption', 100, '2021-04-17', 'googlepay');

select sum(Amount) from monthlybill; 
/*Smruti - Ads*/
CREATE TABLE adsplatform(
  platformID int(11) NOT NULL,
  platform varchar(50) NOT NULL,
  cost int(11),
  PRIMARY KEY (platformID)
);

insert into adsplatform 
values
(1,'Instagram',100),
(2,'Pune Times',70),
(3,'Flyers',900),
(4,'Pune Mirror', 80),
(5,'Posters',1000),
(6,'Whatsapp',50),
(7,'Sakal Times', 80);


CREATE TABLE Ads (
adsId INT NOT NULL ,
platform VARCHAR(50) NOT NULL,
platformID int,
foreign key(platformID) references adsplatform(platformID),
couponCode varchar(60),
date date,
discount int,
PRIMARY KEY(adsId)
);

insert into Ads
(adsId, platform, platformID,couponCode, date, discount)
values
(1,'Instagram',1,'025', '2020-06-15', '25'),
(2,'Pune Times',2,'00','2020-06-16','0'),
(3,'Flyers',3,'150','2020-07-5','15'),
(4,'Instagram',1,'010','2020-09-04','10'),
(5,'Whatsapp',6,'00','2020-09-28','00'),
(6,'Sakal Times',7,'130','2020-10-19','13'),
(7,'Posters',5,'00','2020-11-14','00'),
(8,'Instagram',1,'020','2020-12-31','20'),
(9,'Pune Mirror',4,'021','2020-12-31','20');

desc ads;


select sum(adsplatform.cost) as adsCost 
from adsplatform, ads
where ads.platformID = adsplatform.platformID; 



/*Ose - Menu*/
create table menu (dishID int , dishName varchar(30), price int, 
category varchar(30), primary key(dishID));

desc menu;

insert into menu
(dishID, dishName, price, category)
values
(1,"Margherita Pizza", 170, "Pizza"),
(2,"Peppy paneer Pizza", 190, "Pizza"),
(3,"Cheese and corn Pizza",180, "Pizza"),
(4,"Mexican green wave Pizza",180,"Pizza"),
(5,"Veg Burger",80,"Burger"),
(6,"Cheese Burger",90,"Burger"),
(7,"Spicy Paneer Burger",100,"Burger"),
(8,"Cold Coffee",30,"Beverage"),
(9,"Frapee",50,"Beverage"),
(10,"Hot Chocolate",50,"Beverage");

/*Prajwal - Orders*/
create table orders (orderID int ,name varchar(30), contact int, 
dishID int, tax int , rating int, Quantity int, medium varchar(15), 
primary key(orderID), foreign key(dishID)  references menu(dishID));

/*Date missing in orders */

alter table orders
modify contact bigint;

insert into orders
(orderID, name, contact, dishID, tax, rating, quantity, medium)
values
(1, 'bhanu' ,'8998667960', 2, 22, 4, 2, 'gpay'),
(2, 'pratap' ,'9867668992', 1, 24, 4, 3, 'gpay'),
(3, 'akshay' ,'7789654921', 4, 20, 3, 2, 'phonepay'),
(4, 'rakhi' , '7845290757', 7, 28, 4, 3, 'cash'),
(5, 'rohan' ,'5987597088', 5, 18, 3, 1, 'amazon pay'),
(6, 'kabir' ,'7799554789', 3, 32, 4, 4, 'paytnm'),
(7, 'prachi' ,'8788997766', 8, 35, 5,5, 'cash'),
(8, 'preeti', '9723156790', 9, 41, 5, 6, 'paypal');

insert into orders
(orderID, name, contact, dishID, tax, rating, quantity, medium)
values
(9, 'pranav' ,'8998660060', 1, 10, 3, 7, 'cash'),
(10, 'pratik' ,'9867667992', 2,13, 5, 8, 'phonepay'),
(11, 'sahil' ,'7789677921', 7, 15, 4, 2, 'gpay'),
(12, 'aaryan' , '7800290757', 4, 11, 3, 3, 'gpay'),
(13, 'adil' ,'5980097088', 3, 1, 12, 5, 'paypal'),
(14, 'sanket' ,'7790054789', 5, 15, 5, 4, 'amazonpay'),
(15, 'sunil' ,'8780097766', 9, 20, 4, 5,'phonepay'),
(16, 'pradip', '9720056790', 8, 40, 3, 6, 'cash'),
(17, 'kuldip' , '9234670088', 9, 30,4, 5, 'gpay'),
(18, 'joseph' ,'7799880011', 10,25, 5,4, 'cash'),
(19, 'ajit' ,'9120030021', 1,  16, 5, 4, 'phonepay'),
(20, 'rahul' ,'7796838367', 3, 10,5, 3, 'cash');


insert into orders
(orderID, name, contact, dishID, tax, rating, quantity, medium)
values
(21, 'kartik', '9720056790',1,4, 15,5, 'phonepay'),
(22,'mangal','4356789012',4,5,20,5,'cash'),
(23,'neha','9201876500',6,6,22,4,'cash'),
(24,'sangram','7796834577',7,8,25,4,'gpay'),
(25,'aditya','9869779683',4,3,10,5,'amazonpay'),
(26,'abhijeet','9970556677',2,8,16,4,'paypal'),
(27,'umesh','9087879065',7,9,17,4,'gpay'),
(28,'somesh','7557988900',3,1,24,5,'phonepay'),
(29,'suraj','9008789006',5,3,30,4,'phonepay'),
(30,'sarah','6989798080',4,9,23,3,'phonepay');

insert into orders
(orderID, name, contact, dishID, tax, rating, quantity, medium)
values
(31, 'kartik', '9720056790',1,4, 15,5, 'phonepay'),
(32,'mangal','4356789012',4,5,20,5,'cash'),
(33,'neha','9201876500',6,6,22,4,'cash'),
(34,'sangram','7796834577',7,8,25,4,'gpay'),
(35,'aditya','9869779683',4,3,10,5,'amazonpay'),
(36,'abhijeet','9970556677',2,8,16,4,'paypal'),
(37,'umesh','9087879065',7,9,17,4,'gpay'),
(38,'somesh','7557988900',3,1,24,5,'phonepay'),
(39,'suraj','9008789006',5,3,30,4,'phonepay'),
(40,'sarah','6989798080',4,9,23,3,'phonepay');

select sum((menu.price+orders.tax)*orders.quantity) as totalAmt 
from orders,menu where menu.dishID=orders.dishID; 

/*Hisab must calculate profit so
orders total - monthly budget */ 

create view totalbill as select sum(Amount) as bill from monthlybill; 

create view totalorders as select sum((menu.price+tax)*quantity) as totalAmt 
from orders,menu; 
use fastfood;
select totalAmt-bill as profit 
from totalorders, totalbill;

/* 
createdBy 
createdDate
lastUpdatedBy
lastUpdateDate*/
