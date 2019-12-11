CREATE TABLE employees (
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR (30),
	last_name VARCHAR (30),
	gender VARCHAR (5),
	hire_date DATE,
	PRIMARY KEY (emp_no)
);

--number 1
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM
employees
JOIN 
salaries
on employees.emp_no = salaries.emp_no

-- number 2
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31'
order by hire_date asc;

--num 5
SELECT first_name, last_name
FROM employees
WHERE first_name ='Hercules' AND last_name LIKE 'B%'

--num 8
SELECT last_name, count(last_name) as c
FROM employees 
GROUP BY last_name
ORDER BY c desc;

--num 3
CREATE TABLE departments (
	dep_no VARCHAR (30) PRIMARY KEY,
	dep_name VARCHAR (30)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR (30),
	emp_no_ INT PRIMARY KEY,
	from_date DATE,
	to_date DATE
);

SELECT d.dep_no, d.dep_name, dm.emp_no_, e.first_name, e.last_name,dm.from_date, dm.to_date
FROM
departments d
JOIN 
dept_manager dm
on d.dep_no = dm.dept_no
JOIN employees e
on dm.emp_no_=e.emp_no

--num 4
CREATE TABLE dept_emp (
	emp_no_ INT,
	dept_no VARCHAR (30),
	from_date DATE,
	to_date DATE
);

SELECT de.emp_no_, e.last_name, e.first_name, d.dep_name
FROM
employees e
JOIN 
dept_emp de
on e.emp_no=de.emp_no_
JOIN departments d
on de.dept_no=d.dep_no

-- num 6
SELECT de.emp_no_, e.last_name, e.first_name, d.dep_name
FROM
employees e
JOIN 
dept_emp de
on e.emp_no=de.emp_no_
JOIN departments d
on de.dept_no=d.dep_no
WHERE d.dep_name='Sales'

--num 7
SELECT de.emp_no_, e.last_name, e.first_name, d.dep_name
FROM
employees e
JOIN 
dept_emp de
on e.emp_no=de.emp_no_
JOIN departments d
on de.dept_no=d.dep_no
WHERE d.dep_name='Sales' OR d.dep_name='Development'