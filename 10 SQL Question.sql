create table emp(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

delete from emp;
insert into emp
values(1, 'Ankit', 100,10000, 4, 39);
insert into emp
values (2, 'Mohit', 100, 15000, 5, 48);
insert into emp
values (3, 'Vikas', 100, 10000,4,37);
insert into emp
values (4, 'Rohit', 100, 5000, 2, 16);
insert into emp
values (5, 'Mudit', 200, 12000, 6,55);
insert into emp
values (6, 'Agam', 200, 12000,2, 14);
insert into emp
values (7, 'Sanjay', 200, 9000, 2,13);
insert into emp
values (8, 'Ashish', 200,5000,2,12);
insert into emp
values (9, 'Mukesh',300,6000,6,51);
insert into emp
values (10, 'Rakesh',300,7000,6,50);
insert into emp
values (7, 'Sanjay', 200, 9000, 2,13);

----------------------------------------------------------------
create table department(
 
 dept_id int,
 dept_name varchar(10)
 );
 
insert into department values(100,'Analytics');
insert into department values(300,'IT');

----------------------------------------------------------------

create table orders(
 customer_name char(10),
 order_date date,
 order_amount int,
 customer_gender char(6)
 );
 
 insert into orders values('Shilpa','2020-01-01',10000,'Male');
 insert into orders values('Rahul','2020-01-02',12000,'Female');
 insert into orders values('Shilpa','2020-01-02',12000,'Male');
 insert into orders values('Rohit','2020-01-03',15000,'Female');
 insert into orders values('Shilpa','2020-01-03',14000,'Male');
 -----------------------------------------------------------------

select * from emp
select * from department
select * from orders


--Q1 -> How to find duplicates
select emp_name,count(1) from emp group by emp_name having count(1)>1

--Q2 -> How to delete duplicates
with cte as(
select * , row_number() over(partition by emp_id order by emp_name) as rn from emp
)
delete from cte where rn>1

--Q3 -> difference between union and union all
--Answer:
--UNION:
--Combines the result sets of two or more SELECT queries and removes duplicate rows.
--UNION ALL:
--Combines the result sets of two or more SELECT queries without removing duplicates.

--Q4 -> difference between rank, row_number and dense_rank
select emp.* , rank() over(partition by department_id order by salary desc)as rn from emp

select emp.* , dense_rank() over(partition by department_id order by salary desc)as rn from emp

select emp.* , row_number() over(partition by department_id order by salary desc)as rn from emp

--Q5 -> employees who are not present in department table
select emp.*,department.dept_id,department.dept_name from emp
LEFT JOIN department on emp.department_id = department.dept_id
where department.dept_name is null

--Q6 -> second highest salary in each department
select * from(select emp.* , dense_rank() over(partition by department_id order by salary desc)as rn from emp) a
where rn=2

--Q7 -> find all transaction done by Shilpa
select * from orders where customer_name='Shilpa'

--Q8 -> self join, manager salary > emp salary

--Q9 -> joins left join/inner join


--Q10 -> update query to swap gender
update orders set customer_gender = case when customer_gender='Male' then 'Female'
										when customer_gender='Female' then 'Male' end











