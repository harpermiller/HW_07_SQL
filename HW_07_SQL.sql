create table departments (
	dept_no VARCHAR,
	dept_name VARCHAR
)
create table dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE
)
create table dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	from_date DATE,
	to_date DATE
)
create table employees(
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	Gender VARCHAR(1),
	hire_date DATE
)
create table salaries (
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE
)
create table titles (
	emp_no INT,
	title VARCHAR,
	from_date DATE,
	to_date DATE
)
#1
select employees.emp_no, last_name, first_name, gender, salaries.salary from employees
inner join salaries on employees.emp_no = salaries.emp_no

#2
select * from salaries
select last_name, first_name, hire_date from employees
where date_part('year', hire_date) = 1986

#3
select departments.dept_no, departments.dept_name, 
		dept_manager.emp_no, employees.last_name, 
		employees.first_name, dept_manager.from_date,
		dept_manager.to_date
from dept_manager
inner join departments on departments.dept_no=dept_manager.dept_no
inner join employees on dept_manager.emp_no=employees.emp_no

#4
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no

#5
select first_name, last_name from employees
where first_name like 'Hercules' AND last_name like 'B%'

#6
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'

#7
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

#8
select employees.last_name, count(employees.last_name) as frequency from employees
group by employees.last_name
order by frequency desc














