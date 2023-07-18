use javabackend
-- write a DDL command to create this table
CREATE TABLE Employee (
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  job_start_date DATE,
  salary DECIMAL(10, 2)
);

-- write a DDL command to add a new column "department"
ALTER TABLE Employee
ADD department VARCHAR(50);

-- Write a SQL query to find the highest salary from an "Employee" table.
SELECT MAX(salary) AS highest_salary
FROM Employee;

-- write a query to find all the employees who joined in the last 6 months;
SELECT *
FROM Employee
WHERE job_start_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- write a query display number of employees in each department.
SELECT department, COUNT(*) AS employee_count
FROM Employee
GROUP BY department;

-- Write a SQL query to update email_address on the consultant_detail table
UPDATE consultant_detail
SET email_address = 'sanjeev@capitalsoft.com'
WHERE id = '1001';

-- Write a SQL to find total number of submissions for each constulant.
SELECT consultant_id, COUNT(*) AS total_submissions
FROM submission
GROUP BY consultant_id;

-- Write a SQL to find total number of submissions for each constulant by each submission day
SELECT consultant_id, DATE(submission_date) AS submission_day, COUNT(*) AS total_submissions
FROM submission
GROUP BY consultant_id, DATE(submission_date);

INSERT INTO submission (id,consultant_id,submission_date,vendor_company,vendor_name,vendor_email_address,vendor_phone_number,
  implementation_partner,client_name,pay_rate,submission_status,submission_type,city,state,zip
) VALUES
  (100, 1001, '2023-07-01', 'Vendor Company 1', 'Vendor Name 1', 'vendor1@example.com', '1234567890', 'Implementation Partner 1', 'Client Name 1', 100.00, 'Pending', 'Type 1', 'City 1', 'State 1', '12345'),
  (104, 1002, '2023-07-02', 'Vendor Company 2', 'Vendor Name 2', 'vendor2@example.com', '2345678901', 'Implementation Partner 2', 'Client Name 2', 200.00, 'Approved', 'Type 2', 'City 2', 'State 2', '23456'),
  (105, 1003, '2023-07-03', 'Vendor Company 3', 'Vendor Name 3', 'vendor3@example.com', '3456789012', 'Implementation Partner 3', 'Client Name 3', 300.00, 'Rejected', 'Type 3', 'City 3', 'State 3', '34567');

INSERT INTO javabackend.lead_detail (id, first_name, last_name, email_address, phone_number)
VALUES 
  ('700', 'John', 'Doe', 'john@capital.com', '316-372-6534'),
  ('706', 'Jane', 'Smith', 'jane@softtech.com', '987-654-3210'),
  ('835', 'Michael', 'Johnson', 'michael@keshtech.com', '286-324-3383');
  
  INSERT INTO consultant_detail (id, lead_id, first_name, last_name, email_address, phone_number)
VALUES 
  ('1001', '12345', 'Sanjeev', 'Reddy', 'john@capitalsoft.com', '123-456-7890'),
  ('1002', '54321', 'Manohar', 'Reddy', 'jane@keshtech.com', '987-654-3210'),
  ('1003', '98765', 'Naveen', 'Gunda', 'michael@cis.com', '918-222-3132');
  
  INSERT INTO submission_update (id, submission_id, update_text, created_date)
VALUES 
  ('5003', '12345', 'Update 1', '2023-07-17'),
  ('6002', '54321', 'Update 2', '2023-07-17'),
  ('7004', '98765', 'Update 3', '2023-07-17');
  
  
  
  -- Write a SQL query to update email_address on the consultant_detail table
  UPDATE consultant_detail
SET email_address = 'newemail@example.com'
WHERE id = 1001;



-- write a SQL to delete all submissions where "rate" is null
DELETE FROM submission
WHERE pay_rate is null and id > 0

-- Retreiving submissions given lead name and submission date
SELECT submission.* 
FROM submission
JOIN lead_detail ON submission.id = lead_detail.id
WHERE lead_detail.first_name = 'John' 
  AND lead_detail.last_name = 'Doe'
  AND submission.submission_date = '2023-07-15';
  
  
  -- -- finding number of submission by each lead
SELECT lead_detail.id, lead_detail.first_name, lead_detail.last_name, COUNT(submission.id) AS submission_count
FROM lead_detail
LEFT JOIN submission ON lead_detail.id = submission.id
GROUP BY lead_detail.id, lead_detail.first_name, lead_detail.last_name;

