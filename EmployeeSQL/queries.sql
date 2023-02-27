-- Lists the employee number, last name, first name, sex, and salary of each employee.
SELECT e.employee_id, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s 
ON e.employee_id=s.employee_id;

-- Lists the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- Lists the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT d.dept_name, dm.dept_id, e.employee_id, e.last_name, e.first_name
FROM employees AS e
JOIN dept_manager AS dm
ON e.employee_id=dm.employee_id
JOIN departments AS d 
ON d.dept_id=dm.dept_id;

-- Lists the department number for each employee along with that employee’s employee number, 
--    last name, first name, and department name.
-- *Creates a view for later use*

CREATE VIEW employee_dept AS
SELECT de.dept_id, e.employee_id, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.employee_id=de.employee_id
JOIN departments AS d 
ON d.dept_id=de.dept_id;

SELECT * FROM employee_dept; 

-- Lists first name, last name, and sex of each employee whose first name is 
--	  Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- Lists each employee in the Sales department, including their employee number, last name, and first name.
-- *Uses view that was created earlier*
SELECT employee_id, last_name, first_name, dept_name
FROM employee_dept 
WHERE dept_name = 'Sales';

-- Lists each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- *Uses view that was created earlier*
SELECT employee_id, last_name, first_name, dept_name
FROM employee_dept 
WHERE dept_name = 'Development' OR dept_name = 'Sales';

-- Lists the frequency counts, in descending order, of all the employee last names 
--    (i.e. how many employees share each last name).
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;