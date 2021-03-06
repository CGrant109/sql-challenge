
--1. List the following details of each employee: employee number, 
-- last name, first name, sex, and salary.
SELECT "Employees".emp_no AS Employee_Number, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Employees"
JOIN "Salaries" ON "Employees".emp_no = "Salaries".emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT "Employees".last_name, "Employees".first_name, "Employees".hire_date
FROM "Employees"
WHERE "Employees".hire_date > '1986-1-1'::date AND "Employees".hire_date < '1987-1-1'::date

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT "Dept_Manager".dept_no, "Departments".dept_name, "Dept_Manager".emp_no, "Employees".last_name, "Employees".first_name
FROM "Dept_Manager"
JOIN "Employees" 
ON "Dept_Manager".emp_no = "Employees".emp_no
JOIN "Departments"
ON "Dept_Manager".dept_no = "Departments".dept_no

--4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_emp" 
ON "Employees".emp_no = "Dept_emp".emp_no
JOIN "Departments"
ON "Dept_emp".dept_no = "Departments".dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT "Employees".first_name, "Employees".last_name, "Employees".sex
from "Employees"
WHERE "Employees".first_name = 'Hercules' AND "Employees".last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_emp" 
ON "Employees".emp_no = "Dept_emp".emp_no
JOIN "Departments" 
ON "Dept_emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Sales'


--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_emp" 
ON "Employees".emp_no = "Dept_emp".emp_no
JOIN "Departments" 
ON "Dept_emp".dept_no = "Departments".dept_no
WHERE "Departments".dept_name = 'Development' OR "Departments".dept_name = 'Sales'

--8. List the frequency count of employee last names (i.e., how many employees share each last name) 
--in descending order.
SELECT "Employees".last_name, Count (*)
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY Count (*) DESC;