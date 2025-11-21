create database sanjana_db
--drop database sanjana_db

use sanjana_db
create  table table_marksheet
(name nvarchar(max),
english nvarchar(max),
hindi nvarchar(max),
maths nvarchar(max),
sst nvarchar(max),
science nvarchar(max))

select * from table_marksheet
insert into table_marksheet
(name,english,hindi,maths,sst,science)
values('sanjana','85','64','87','53','42')


select * from [dbo].[table_marksheet]
 drop table table_marksheet
 drop database sanjana_db

 use master
 use AdventureWorksLT2022

 select * from [SalesLT].[Customer]
 --where CustomerID in (2,3,4)
 --where CustomerID not in (2,3,4)
 update [SalesLT].[Customer]
 set MiddleName='abc'
 where CustomerID=2

 delete from [SalesLT].[Customer]
 where customerid=2

 select customerid,count(phone) from [SalesLT].[Customer]
 group by CustomerID

 select  count (*) from [SalesLT].[Customer]
 select count (middlename) from [SalesLT].[Customer]

 select distinct count (customerid) from [SalesLT].[Customer]
 select count (customerid) from [SalesLT].[Customer]
 group by CustomerID


 select productid,count(unitprice) as count,sum (unitprice) as 'sum',avg(unitprice) as 'avg' from [SalesLT].[SalesOrderDetail]
 group by ProductID

 use AdventureWorksLT2022
 select * from [SalesLT].[Product] 
 --where color like 'red'
 --where color like '%r'
--  where color like '%r'
   --where color like '%e%'
   --where color like 'r%d'
   --WHERE (ProductNumber like '%m' or ProductNumber like '%r') and color like 'red'
   --where SellStartDate between '2002-06-01 00:00:00.000' and '2005-07-01 00:00:00.000'
   --where SellStartDate not between '2002-06-01 00:00:00.000' and '2005-07-01 00:00:00.000'
   --where color !='red'
   select color,count (color) as count  from [SalesLT].[Product]group by color order by count(color) desc


  -- alias=nike name

	use AdventureWorksLT2022
   select top 10 * from [SalesLT].[Address]
   select top 10 * from [SalesLT].[CustomerAddress]
   select top 10 * from [SalesLT].[SalesOrderHeader]

select top 2 * from [SalesLT].[SalesOrderHeader]
select top 2 * from [SalesLT].[SalesOrderDetail]
select top 2 * from [SalesLT].[Product]


select firstname,city,stateprovince,
--name,
select CustomerID, name,sum(subtotal) as subtotal,sum(taxamt) as taxamt, sum(freight) as freight,sum(totaldue) as totaldue
 from
 (select * from
(select a.customerid,a.firstname,b.addressid,c.addressline1,c.city,c.stateprovince from [SalesLT].[Address] as a
inner join [SalesLT].[CustomerAddress] as b on b.customerid=a.customerID
inner join[SalesLT].[SalesOrderHeader] as c on c.addressID=b.addressID)
as cust_detail
inner join 

(select d.salesorderid,f.ProductID, f.name,d.customerid,d.subtotal,d.taxamt,d.freight,d.totaldue from [SalesLT].[SalesOrderHeader]as d
inner join [SalesLT].[SalesOrderDetail] as e on e.SalesOrderID=d.SalesOrderID 
inner join [SalesLT].[Product]as f on f.ProductID=e.ProductID) as sales_detail
on cust_detail.customerid=sales_detail.cust_id) as final table
group by firstname,city,stateprovince,freight,totaldue,name




select * from [SalesLT].[Product]
select color,sum(standardcost) as standardcost from [SalesLT].[Product]
where color='black'
group by color
having sum(standardcost)>10000

select top 2 * from [SalesLT].[Product]
select top 2 * from [SalesLT].[SalesOrderDetail]
select top 2 * from [SalesLT].[SalesOrderHeader]


select ordermonth,name,count(ordermonth) as no_order,iif(count(ordermonth)>10,'more than 10','less than 10') as bucket 
from
(select a.productid, a.Name, format(cast(c.OrderDate as date),'mmm-yy') as ordermonth from [SalesLT].[Product] as a
inner join [SalesLT].[SalesOrderDetail] as b on b.productid=a.productid
inner join [SalesLT].[SalesOrderHeader] as c on c.salesorderid=b.salesorderid) as d 
group by ordermonth, name

use AdventureWorksLT2022
select *,
case
when UnitPrice>1000 and linetotal>1000 then 'more than 1000'
when unitprice>500 then 'more than 500'
else 'less than 500'
end as bucket
from [SalesLT].[SalesOrderDetail]  

select firstname,MiddleName,LastName,
case
when middlename is null then CONCAT(firstname,' ',LastName)
else concat(firstname,' ',MiddleName,' ',lastname)
end as full_name from [SalesLT].[Customer]
where middlename is null

select AddressLine1,AddressLine2,coalesce(AddressLine2,addressline1) from [SalesLT].[Address]


select addressid from [SalesLT].[Address]
select CustomerID from [SalesLT].[Customer]
select customerid, addressid from [SalesLT].[CustomerAddress]
select ProductModelID from[SalesLT].[ProductModel]
select ProductID, productcategoryid from[SalesLT].[Product]
select productcategoryid from[SalesLT].[ProductCategory]
--select ProductDescriptionID from[SalesLT].[ProductDescription]
select ProductModelID,ProductDescriptionID from[SalesLT].[ProductModelProductDescription]
select SalesOrderID,ProductID from[SalesLT].[SalesOrderDetail]
select* from [SalesLT].[ProductCategory]
select * from [SalesLT].[ProductDescription]
select * from [SalesLT].[Product]
select * from [SalesLT].[ProductModel]
select SalesOrderID[SalesLT].[Product],CustomerID from[SalesLT].[SalesOrderHeader]
select ProductDescriptionID from[SalesLT].[ProductDescription]
select ProductModelID from[SalesLT].[ProductModel]


