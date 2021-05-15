CREATE TABLE Departments (
 dept_no VARCHAR PRIMARY KEY,
 dept_name VARCHAR NOT NULL
);

CREATE TABLE Titles (
 title_id VARCHAR PRIMARY KEY,
 title VARCHAR NOT NULL
);

CREATE TABLE Employees (
   emp_no INTEGER PRIMARY KEY,
emp_title_id VARCHAR,
   FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id),
   birth_date DATE,
   first_name VARCHAR,
   last_name VARCHAR,
   sex VARCHAR,
   hire_date DATE
);

CREATE TABLE Dept_manager (
 dept_no VARCHAR,
 FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
 emp_no INTEGER,
 FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
 PRIMARY KEY (dept_no, emp_no)
);


CREATE TABLE Dept_emp (
 emp_no INTEGER,
 FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
 dept_no VARCHAR,
 FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
 PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE Salaries (
 emp_no INTEGER PRIMARY KEY,
 FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
 salary INTEGER NOT NULL
);