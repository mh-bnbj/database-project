select * 
from  product;

select * 
from customer 

select type 
from product ;

select * 
from buy;

select top 10 (customer_id)
from buy, bill , customer
where buy.bill_id=bill.id and customer.National_id=buy.customer_National_id and bill.date<= getDate()-7

select top 10 (customer_id)
from buy, bill , customer
where buy.bill_id=bill.id and customer.National_id=buy.customer_National_id and bill.date<= getDate()-30

select count product.id as t 
from product , basket 
where product.date<= getDate()-7

select count product.id as t 
from product , basket 
where product.date<= getDate()-30

select product_name 
from product 
where product.discount > 15%;

select supplier_name 
from supplier , product 
where product.id='selected item' and supplier.id=product.supplier_id

select suupplier_name, max (csat) 
from supplier ,product
where product.id='selected item' and supplier.id=product.supplier_id

select top 10 
from buy,customer 
where buy.customer_NationalId=customer.NationalId
order by buy.date
asc           


select text 
from commend ,product 
where product.id=commend.product_id;

select max(point) ,top3 
from commend, product  
where product.id=commend.product_id;

select min(point) ,top3 
from commend, product  
where product.id=commend.product_id;

select avg 
from buy, seller 
where seller.employee_id=buy.seller_employee_id and buy.date<= getDate()-30

select *
from customer 
where city ='شهر'

select *
from supllier
where address='شهر'



