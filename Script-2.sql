#Q1
create table salesman(
	salesman_id int not null,
	name varchar(255) not null,
	city varchar(255) ,
	commission int, 
	primary key (salesman_id)
	
)



update salesman 
set commission = 0.13
where salesman_id=5007;

select name, commission from salesman s ;


#Q2 
select distinct salesman_id from  salesman s ;

#Q3
select name, city  from  salesman s 
where city ='Paris';

#Q4
create table customers(
	customer_id int not null ,
	cust_name varchar(255) not null,
	city varchar(255) not null,
	grade int ,
	salesman_id int,
	primary key(customer_id),
	foreign key(salesman_id) references salesman(salesman_id)
);


drop  table customers ;

INSERT INTO mazerunner.customers (customer_id ,cust_name,city,grade,salesman_id) VALUES
	 (3001,'Brad Guzan','London',NULL,5005),
	 (3002,'Nick Rimando','New York',100,5001),
	 (3003,'Jozy Altidore','Moscow',200,5007),
	 (3004,'Fabian Johnson','Paris',300,5006),
	 (3005,'Graham Zusi','California',200,5002),
	 (3007,'Brad Davis','New York',200,5001),
	(3008,'Julian Green','London',300,5002),
	(3009,'Geoff Cameron','Berlin',100,5003);


select *  from  customers c 
where grade =200;





insert into customers(customer_id, cust_name, city, grade , salesman_id)
values('3007' 'Brad Davis', 'New York',  200, 5001);

ALTER TABLE mazerunner.customers MODIFY COLUMN customer_id int(11)
NOT NULL ;

#Q5
create table orders(
	ord_no int not null ,
	purch_amt double(10,2) not null,
	ord_date date not null,
	customer_id int not null,
	salesman_id int not null,
	primary key(ord_no),
	foreign key(customer_id) references customers(customer_id),
	foreign key(salesman_id) references salesman(salesman_id)
);
insert into orders (ord_no, purch_amt, ord_date , customer_id, salesman_id)
values(70013, 3045.60, '2012-04-25', 3002, 5001);

update orders 
set ord_no =70001 where customer_id =3005;

select ord_no, ord_date, purch_amt from orders o 
where salesman_id =5001;

#Q12
select *  from customers c 
where city ='New York' or (not grade >100);

#Q13
select * from salesman s 
where commission between 0.10 and 0.14;

#(select winner from nobel_win where year =1971 and subject='Literature';)
#Q14
select  * from customers c 
where cust_name like '%n';

#Q15
select * from salesman s 
where name like 'N__l%';
#Q16
select * from customers c 
where grade is null ;

#Q17
select  sum(purch_amt) from orders o ;

#Q18
select count(distinct salesman_id) from orders o ;

#Q19
select max(grade), city from customers c 
group by city ;

#Q20
select max(purch_amt), o.customer_id, c.cust_name from orders o, customers c where o.customer_id = c.customer_id group by o.customer_id;
#Q21
select max(purch_amt),o.customer_id , ord_date, cust_name from orders o, customers c  where c.customer_id=o.customer_id group by o.customer_id;
#Q22
select  max(purch_amt),o.salesman_id , o.customer_id, cust_name, o.ord_date from orders o, customers c where ord_date ='2012-08-17' and c.customer_id =o.customer_id  group by o.salesman_id ;

#Q23
select max(o.purch_amt), o.customer_id, o.ord_date, cust_name from orders o, customers c where 0c.customer_id= o.customer_id and o.purch_amt>2000 group by o.customer_id, o.ord_date ; 

#Q24
select count(*), purch_amt, ord_date,o.ord_no , customer_id from orders o where o.ord_date ='2012-08-17'   ;





#################################-----NEW QUESTIONS-----##########################
#Q1
select  cust_name "Customer Name", s.name "SalesMan Name", c.city from customers c , salesman s where c.city=s.city; 
#Q2
select cust_name, s.name "Salesman Name" from customers c , salesman s where c.salesman_id =s.salesman_id order by cust_name  desc ;
#Q3
select o.ord_no, cust_name, c.customer_id  from customers c , salesman s, orders o where c.city not in(select distinct(c.salesman_id) from customers c2);

select o.ord_no, o.customer_id , o.salesman_id  from  customers c , orders o , salesman s where c.city<> s.city and o.customer_id=c.customer_id and o.salesman_id= s.salesman_id; 
#Q4
select ord_no, s.name, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id  from orders o , salesman s where o.salesman_id = s.salesman_id and s.name ='Paul Adam';
select * from orders o where o.salesman_id =(select s.salesman_id from salesman s where s.name='Paul Adam');



select * from orders o where o.salesman_id =(select salesman_id from salesman s where s.name='Paul Adam');
#Q5
select *  from orders o where o.purch_amt>(select avg(purch_amt) from orders o2 where o.ord_date='2012-10-10' group by o.customer_id); 
#Q6
select *, s2.city from orders o, salesman s2 where o.salesman_id = s2.salesman_id and s2.city= 'Paris'

select *, s2.city from orders o, salesman s2 where o.salesman_id = s2.salesman_id and s2.city= 'Paris'

select *, (select city from salesman s2 where s2.salesman_id = o.salesman_id) as salesman_city from orders o where o.salesman_id  in (select s.salesman_id from salesman s where s.city = 'Paris');

#q7
select s.salesman_id , max(s.commission),ord_no, o.purch_amt,o.ord_date , o.customer_id, cust_name, o.customer_id  from orders o, salesman s , customers c where s.salesman_id = o.salesman_id and o.customer_id=c.customer_id group by o.salesman_id ;

#Q7 - Remodelled
select ord_no, o.purch_amt, o.ord_date, o.salesman_id  from orders o 
where o.salesman_id in(select s.salesman_id from salesman s where s.commission=(select max(s2.commission) from salesman s2));

select * from salesman s 






select * from orders o where o.salesman_id in (select s.salesman_id from salesman s where s.commission=(select max(s.commission) from salesman s));



select * from orders o where o.salesman_id in(select s.salesman_id from salesman s where s.commission=(select max(s2.commission) from salesman s2));


#q8
select s.name, s.salesman_id from salesman s where 1< (select count(*) from customers c where c.salesman_id = s.salesman_id ) ;
