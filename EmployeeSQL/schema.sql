-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "employee_ID" INT   NOT NULL,
    "title_ID" VARCHAR   NOT NULL,
    "DOB" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_ID"
     )
);

CREATE TABLE "salaries" (
    "employee_ID" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "employee_ID"
     )
);

CREATE TABLE "departments" (
    "dept_ID" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_ID"
     )
);

CREATE TABLE "titles" (
    "title_ID" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_ID"
     )
);

CREATE TABLE "dept_manager" (
    "dept_ID" VARCHAR   NOT NULL,
    "employee_ID" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_ID","employee_ID"
     )
);

CREATE TABLE "dept_emp" (
    "employee_ID" INT   NOT NULL,
    "dept_ID" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "employee_ID","dept_ID"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_ID" FOREIGN KEY("title_ID")
REFERENCES "titles" ("title_ID");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_ID" FOREIGN KEY("employee_ID")
REFERENCES "employees" ("employee_ID");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_ID" FOREIGN KEY("dept_ID")
REFERENCES "departments" ("dept_ID");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_employee_ID" FOREIGN KEY("employee_ID")
REFERENCES "employees" ("employee_ID");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_employee_ID" FOREIGN KEY("employee_ID")
REFERENCES "employees" ("employee_ID");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_ID" FOREIGN KEY("dept_ID")
REFERENCES "departments" ("dept_ID");

