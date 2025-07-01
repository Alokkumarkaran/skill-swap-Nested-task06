# 📘 Task 6 – Subqueries and Nested Queries (Skill-Swap E-learning Platform)

## 🎯 Objective

The goal of this task is to understand and use **SQL subqueries and nested queries** inside `SELECT`, `WHERE`, and `FROM` clauses. Subqueries are used to write powerful, layered queries and perform advanced filtering.

---

## 🛠 Tools Used

- MySQL Workbench
- Screenshot tool (Snipping Tool / Lightshot)
- GitHub

---

## 📁 Tables Used from Skill-Swap Project

- `Users` – Stores learner and educator profiles
- `Courses` – Details of all available courses
- `Payments` – Tracks which users paid for which course
- `Enrollments` – Tracks course registrations

---

## 📚 Step-by-Step Subquery Queries

---

### 🔹 1. Users who enrolled in at least one course  
Using a subquery inside `WHERE` with `IN`.

SELECT name
FROM Users
WHERE user_id IN (
    SELECT user_id FROM Enrollments
);
📸 Screenshot:
![Screenshot 2025-07-01 113416](https://github.com/user-attachments/assets/c14e9a58-4f08-448b-9088-54893bd3ea49)


🔹 2. Total amount paid by each user
Using a scalar subquery inside SELECT.


SELECT name,
(
    SELECT SUM(amount)
    FROM Payments
    WHERE Payments.user_id = Users.user_id
) AS total_paid
FROM Users;
📸 Screenshot:
![Screenshot 2025-07-01 113454](https://github.com/user-attachments/assets/8ff59f18-4907-41ce-98bc-e7de4d372a0f)


🔹 3. Average price of high-priced courses (FROM subquery)

SELECT AVG(price) AS average_price
FROM (
    SELECT * FROM Courses
    WHERE price > 300
) AS expensive_courses;
📸 Screenshot:
![Screenshot 2025-07-01 113521](https://github.com/user-attachments/assets/b40d661d-c5cd-4f13-9af0-e9a89c00f965)


🔹 4. Users who paid more than the average total amount
Correlated subquery using HAVING.


SELECT user_id, SUM(amount) AS total_paid
FROM Payments
GROUP BY user_id
HAVING total_paid > (
    SELECT AVG(amount) FROM Payments
);
📸 Screenshot:
![Screenshot 2025-07-01 113648](https://github.com/user-attachments/assets/5e4376f2-36b2-431d-a75b-77f03f759bd5)


🔹 5. Users who made any payment
Using EXISTS to check if a matching row exists in Payments.


SELECT name
FROM Users
WHERE EXISTS (
    SELECT 1 FROM Payments
    WHERE Payments.user_id = Users.user_id
);
📸 Screenshot:
![Screenshot 2025-07-01 113723](https://github.com/user-attachments/assets/5295c66b-3f38-443d-af4f-3166988f19fb)


🔹 6. Users who never enrolled in any course
Using NOT EXISTS.


SELECT name
FROM Users
WHERE NOT EXISTS (
    SELECT 1 FROM Enrollments
    WHERE Enrollments.user_id = Users.user_id
);
📸 Screenshot:
![Screenshot 2025-07-01 113748](https://github.com/user-attachments/assets/cc8ac177-d684-4a49-b6ae-b076d671a01c)


🧠 What I Learned
Concept	Description
Subquery	A query inside another query
Scalar Subquery	Returns a single value
Correlated Subquery	Uses a column from the outer query
EXISTS	Checks if subquery returns any rows
IN	Filters using list of values from subquery
FROM Subquery	Acts as a temporary table

📁 Folder Structure (GitHub Repo)

skill-swap-Nested-task06/
├── Skill_Swap_Nested_Task06.sql          # All SQL queries
├── README.md                     # This explanation file
└── screenshots/                  # Folder with screenshots
   

👨‍💻 Submitted by
Name: Alok Kumar
Role: SQL Developer Intern
Project: Skill-Swap E-learning Platform
Email: alokkumarkaranraj@gmail.com
