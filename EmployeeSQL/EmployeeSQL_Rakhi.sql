-- Delete tables if exists

-- Drop salaries table if exists
DROP TABLE IF EXISTS salaries;

-- Drop dept_emp table if exists
DROP TABLE IF EXISTS dept_emp;

-- Drop dept_manager table if exists
DROP TABLE IF EXISTS dept_manager;

-- Drop titles table if exists
DROP TABLE IF EXISTS titles; 

-- Drop employees table if exists
DROP TABLE IF EXISTS employees;

-- Drop departments table if exists
DROP TABLE IF EXISTS departments;


-- Create departments table
CREATE TABLE departments (
  dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
  dept_name VARCHAR (40) NOT NULL
);

-- Create All Tables

-- Create employees table
CREATE TABLE employees (
  emp_no INT PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR(5) NOT NULL,
  birth_date date NOT NULL,
  first_name VARCHAR (50) NOT NULL,
  last_name VARCHAR (50),
  sex VARCHAR(1) NOT NULL,
  hire_date date NOT NULL
);

-- Create titles table
CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY NOT NULL,
  title VARCHAR(50) NOT NULL
);

-- Create dept_emp table 
-- use composite primary key
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(5) NOT NULL,
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create dept_manager table
-- use composite primary key
CREATE TABLE dept_manager (
  dept_no VARCHAR(5) NOT NULL,
  emp_no INT NOT NULL,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create salaries table
CREATE TABLE salaries (
  emp_no INT PRIMARY KEY NOT NULL ,
  salary INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- import data using pgadmin

-- Import data from departments.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM departments;

-- Import data from employees.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM employees;

-- Import data from titles.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM titles; 

-- Import data from dept_manager.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM dept_manager;

-- Import data from dept_emp.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM dept_emp;

-- Import data from salaries.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM salaries;







