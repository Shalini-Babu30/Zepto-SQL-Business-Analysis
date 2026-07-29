create database sql_project2;
use sql_project2;
CREATE TABLE zepto (
    sku_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(8,2),
    discountpercent DECIMAL(5,2),
    availablequantity INT,
    discountedsellingprice DECIMAL(8,2),
    weightingms INT,
    outofstock TINYINT(1),
    quantity INT
);
SELECT * FROM zepto;
select count(*) from zepto;
SELECT * FROM zepto
LIMIT 10;
select * from zepto 
where name is null
or 
category is null
or 
mrp is null
or 
discountpercent is null
or 
availablequantity is null
or 
discountedsellingprice is null
or 
 weightingms is null
or 
outofstock is null
or 
quantity is null
select distinct category from zepto order by category;
select outofstock,count(sku_id) from zepto group by outofstock;
select name,count(sku_id) as "number of sku" from zepto group by name having count(sku_id)>1 order by count(sku_id) desc;
select * from zepto where mrp = 0 or discountedsellingprice = 0;
delete from zepto where mrp = 0;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM zepto WHERE mrp = 0;
SET SQL_SAFE_UPDATES = 1;
update zepto set mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;
select mrp,discountedsellingprice from zepto;
SET SQL_SAFE_UPDATES = 0;
UPDATE zepto 
SET mrp = mrp/100.0,
    discountedsellingprice = discountedsellingprice/100.0;
    SET SQL_SAFE_UPDATES = 1;
SELECT DISTINCT name, mrp, discountPercent FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;
SELECT DISTINCT name, mrp FROM zepto where outofstock = 1 and mrp >300 order by mrp desc;
select distinct name,weightingms,
case when weightingms<1000 then 'low'
     when weightingms<5000 then 'medium'
     else 'bulk'
     end as weight_category 
from zepto;
SELECT category,
       SUM(weightingms * availablequantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;

--- end of project ---