#Find all employees whose salary is above their department’s average.

select e.dept_id , e.emp_id,e.emp_name,e.hire_date, e.last_sale_date , e.salary, d.dept_name  
from employees e join departments d on e.dept_id= d.dept_id
where e.salary >(select avg(salary) from employees where dept_id= d.dept_id) ;
#List employees who have made at least one sale above the overall average sale amount.
select e.emp_name ,e.emp_id, s.sale_amount  from employees e join sales s on e.emp_id=s.emp_id 
where sale_amount >(select avg(sale_amount) from sales) ;

#Classify employees into salary bands: Low (<40,000), Medium (40,000–70,000), High (>70,000).
select emp_name	, salary ,
	case
		when salary <40000 then 'Low'
        when salary between 40000 and 70000 then 'medium'
        else 'high'
    end as salary_band
from employees;

#Classify sales amounts as: Small (<500), Medium (500–2000), Large (>2000).
select  e.emp_name ,s.sale_amount,
	case
		when s.sale_amount <500 then 'small'
        when s.sale_amount between 500 and 2000 then 'medium'
        else 'large'
    end as sales_band
 from employees e join sales s on e.emp_id=s.emp_id;
 
 #Rank employees by salary within their department.
 select emp_name,dept_id,salary,
 rank() over(partition by dept_id order by salary desc) as dept_rank 
 from employees;
 
 #Calculate each employee’s running total of sales ordered by sale_date.
 select emp_id, sale_date,sale_amount ,
 sum(sale_amount)over(partition by emp_id order by sale_date) as  runningtotal
 from sales
 where emp_id=1;
 
 #Create a CTE to calculate total sales per employee, then list employees with total sales above 10,000.
 with total_sales as(
 select emp_id,sum(sale_amount)as sales_sum from sales group by emp_id)
 select e.emp_name, t.sales_sum from employees e 
 join total_sales t on e.emp_id=t.emp_id
 where t.sales_sum>1000;
 
 #Using a CTE, find the department with the highest average employee salary.
 with avrge as(
 select dept_id ,avg(salary) as avgsalary from employees group by dept_id)
 select d.dept_name,da.avgsalary from avrge da join departments d on da.dept_id=d.dept_id
 order by da.avgsalary desc
 limit 1;
 
 #Find total sales per employee using a CTE, then list employees with total sales greater than 10,000.
 with totalsales as (
 select emp_id , sum(sale_amount)as salesum from sales group by emp_id )
 select e.emp_name  e , t.salesum from employees e join totalsales as t on e.emp_id=t.emp_id
 where t.salesum>10000;
 
 #Rank employees by salary within their department.
 select emp_name , salary , dept_id,
 rank() over(partition by dept_id order by salary desc )
 from employees;
 
 
 
 
 
 
 
 
 