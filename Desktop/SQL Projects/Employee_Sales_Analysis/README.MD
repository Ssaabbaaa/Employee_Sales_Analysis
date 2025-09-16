# Employee Sales Analysis SQL Project

This project contains SQL queries analyzing employee and sales data.  
It demonstrates the use of joins, subqueries, CTEs, window functions, and triggers.

## Datasets
- `employees.csv` – Employee details (ID, name, department, salary, hire date)
- `sales.csv` – Sales records (employee ID, sale amount, sale date)
- `departments.csv` – Department info (ID, name)

## Queries
1. Find employees whose salary is above their department’s average.
2. List employees with at least one sale above overall average.
3. Classify employees into salary bands (Low, Medium, High).
4. Classify sales into bands (Small, Medium, Large).
5. Rank employees by salary within their department.
6. Calculate running total of sales per employee.
7. Use CTEs to calculate total sales per employee and departments.
8. Trigger: prevent high-value sales by low-salary employees.

## How to Use
1. Load the CSV files into MySQL or any SQL client.
2. Run the queries in `queries.sql` to see the results.
3. The trigger will automatically prevent invalid sales inserts.