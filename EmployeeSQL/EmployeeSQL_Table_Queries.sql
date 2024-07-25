-- List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT 
    emp.emp_no AS "Employee Number",
    emp.last_name AS "Last Name", 
    emp.first_name AS "First Name", 
    emp.sex AS "Sex", 
    sal.salary AS "Salary"
FROM employees emp
INNER JOIN salaries sal
ON emp.emp_no = sal.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT	
	first_name AS "First Name", 
	last_name AS "Last Name", 
	hire_date AS "Hire Date"
FROM employees emp
WHERE emp.hire_date >= '01/01/1986'
AND emp.hire_date <= '12/31/1986'
ORDER BY emp.hire_date ASC;


-- List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT 
     dept.dept_no AS "Department Number",
	 dept.dept_name AS "Department Name",
	 dept_m.emp_no AS "Employee Number",
	 emp.last_name AS "Last Name", 
	 emp.first_name AS "First Name"
FROM departments dept
JOIN dept_manager dept_m
ON dept.dept_no = dept_m.dept_no
JOIN employees emp
ON emp.emp_no = dept_m.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT 
	 dept.dept_no AS "Department Number",
	 demp.emp_no AS "Employee Number",
	 emp.last_name AS "Last Name", 
	 emp.first_name AS "First Name",
	 dept.dept_name AS "Department Name"
FROM departments dept
JOIN dept_emp demp
ON   dept.dept_no = demp.dept_no
JOIN employees emp
ON   emp.emp_no = demp.emp_no
ORDER BY dept.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT
	  emp.first_name AS "First Name",
	  emp.last_name AS "Last Name",
	  emp.sex
FROM  employees emp
WHERE emp.first_name = 'Hercules' 
AND   emp.last_name LIKE 'B%'
ORDER BY emp.last_name;

-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT 
		 dept.dept_name AS "Department Name",
		 emp.emp_no AS "Employee Number", 
		 emp.last_name AS "Last Name", 
		 emp.first_name AS "First Name"
FROM     departments dept
JOIN     dept_emp dept_e
ON       dept.dept_no = dept_e.dept_no
JOIN     employees emp
ON       emp.emp_no = dept_e.emp_no
WHERE    dept.dept_name = 'Sales'
ORDER BY dept.dept_no;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT 
		 dept_e.emp_no AS "Employee Number",
		 emp.last_name AS "Last Name", 
		 emp.first_name AS "First Name",
		 dept.dept_name AS "Department Name"
FROM     departments dept
JOIN     dept_emp dept_e
ON       dept.dept_no = dept_e.dept_no
JOIN     employees emp
ON       emp.emp_no = dept_e.emp_no
WHERE	 dept.dept_name = 'Sales'
OR       dept.dept_name = 'Development'
ORDER BY dept.dept_name desc;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT         emp.last_name AS "Last Name", 
COUNT          (emp.last_name) AS "Frequency "
FROM           employees emp
GROUP BY       emp.last_name
ORDER BY COUNT (emp.last_name) DESC;