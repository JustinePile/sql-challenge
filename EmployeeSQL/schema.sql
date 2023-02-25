CREATE TABLE titles(
    title_id VARCHAR PRIMARY KEY NOT NULL,
    title VARCHAR NOT NULL
);

CREATE TABLE employees(
    employee_id INT PRIMARY KEY NOT NULL,
    title_id VARCHAR NOT NULL REFERENCES titles(title_id),
    dob VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date VARCHAR NOT NULL
);

CREATE TABLE salaries(
    employee_id INT NOT NULL REFERENCES employees(employee_id),
    salary INT NOT NULL,
	PRIMARY KEY (employee_id)
);

CREATE TABLE departments(
    dept_id VARCHAR PRIMARY KEY NOT NULL,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_manager(
    dept_id VARCHAR NOT NULL REFERENCES departments(dept_id),
    employee_id INT NOT NULL REFERENCES employees(employee_id),
	PRIMARY KEY (dept_id,employee_id)
);

CREATE TABLE dept_emp(
    employee_id INT NOT NULL REFERENCES employees(employee_id),
    dept_id VARCHAR NOT NULL REFERENCES departments(dept_id),
	PRIMARY KEY (employee_id,dept_id)
);