-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.employee_id, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s 
ON e.employee_id=s.employee_id;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT d.dept_name, dm.dept_id, e.employee_id, e.last_name, e.first_name
FROM employees AS e
JOIN dept_manager AS dm
ON e.employee_id=dm.employee_id
JOIN departments AS d 
ON d.dept_id=dm.dept_id

-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.


-- List first name, last name, and sex of each employee whose first name is 
-- Hercules and whose last name begins with the letter B.

-- List each employee in the Sales department, including their employee number, last name, and first name.

-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).