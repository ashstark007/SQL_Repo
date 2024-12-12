select * from product_info; 

-- update pcategory for all products as laptop
update product_info set pcategory='Laptop';
desc product_info;

-- modify datatype of col pcategory to varchar(30)
alter table product_info modify pcategory varchar(30);

-- change table name to products
alter table product_info rename products;

desc products;
select * from products;