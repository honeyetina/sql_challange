-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,last_name,first_name,sex,salary
From (employees JOIN salaries on employees.emp_no = salaries.emp_no)

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,last_name,hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

-- List the manager of each department with the following information:
 --department number, department name, the manager's employee number, last name, first name.
 SELECT departments.dept_no,departments.dept_name,employees.emp_no,employees.last_name,employees.first_name
 FROM ((departments JOIN dept_manager on departments.dept_no = dept_manager.dept_no)
 	JOIN employees on dept_manager.emp_no = employees.emp_no)



-- List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM
((departments JOIN dept_emp ON departments.dept_no = dept_emp.dept_no)
JOIN employees ON Employees.emp_no = dept_emp.emp_no)




-- List first name, last name, and sex for employees
--whose first name is "Hercules" and last names begin with "B."

SELECT first_name,last_name,sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE '%B%'


-- List all employees in the Sales department, including
--their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM ((departments Join dept_emp on departments.dept_no = dept_emp.dept_no)
	Join employees on dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales'

-- List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM ((departments Join dept_emp on departments.dept_no = dept_emp.dept_no)
	Join employees on dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name IN('Sales','Development')

-- In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

SELECT last_name,count(last_name)as "number of last name"
FROM employees
group by last_name
order by "number of last name" DESC
