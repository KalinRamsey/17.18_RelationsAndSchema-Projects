-- 1) How many people work in the Sales department?
SELECT COUNT(e.emp_name)
AS Num_employees_in_Sales
FROM employee e
JOIN department d
ON d.id = e.department
WHERE d.dept_name = 'Sales';

-- 2) List the names of all employees assigned to the 'Plan Christmas party' project.
SELECT
  e.emp_name as full_name,
  p.project_name as project
FROM employee e
JOIN employee_project ep
ON e.id = ep.emp_id
JOIN project p
ON ep.project_id = p.id
WHERE p.project_name = 'Plan christmas party';

-- 3) List the names of employees from the Warehous department that are assigned to 'Watch paint dry' project.
SELECT
  e.emp_name,
  d.dept_name,
  p.project_name
FROM employee e
JOIN employee_project ep
ON e.id = ep.emp_id
JOIN project p
ON ep.project_id = p.id
JOIN department d
ON e.department = d.id
WHERE p.project_name = 'Watch paint dry'
AND d.dept_name = 'Warehouse';

-- 4) Which projects are the Sales department employees assigned to?
SELECT
  d.dept_name,
  e.emp_name,
  p.project_name
FROM department d
JOIN employee e
ON d.id = e.department
JOIN employee_project ep
ON e.id = ep.emp_id
JOIN project p
ON p.id = ep.project_id
WHERE d.dept_name = 'Sales';

-- 5) List only the managers that are assigned to the 'Watch paint dry' project.
SELECT
  e.emp_name as manager,
  d.dept_name as of_department,
  p.project_name as assigned_to
FROM department d
JOIN employee e
ON e.id = d.manager
JOIN employee_project ep
ON e.id = ep.emp_id
JOIN project p
ON p.id = ep.project_id
WHERE p.project_name = 'Watch paint dry';