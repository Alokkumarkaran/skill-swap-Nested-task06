USE SkillSwapDB;

SELECT name
FROM Users
WHERE user_id IN (
    SELECT user_id FROM Enrollments
);

SELECT name,
(
    SELECT SUM(amount)
    FROM Payments
    WHERE Payments.user_id = Users.user_id
) AS total_paid
FROM Users;

SELECT AVG(price) AS average_price FROM (
    SELECT * FROM Courses
    WHERE price > 300
) AS high_price_courses;

SELECT name
FROM Users
WHERE user_id IN (
    SELECT user_id
    FROM Payments
    GROUP BY user_id
    HAVING SUM(amount) > (
        SELECT AVG(amount) FROM Payments
    )
);

SELECT name
FROM Users
WHERE EXISTS (
    SELECT 1 FROM Payments
    WHERE Payments.user_id = Users.user_id
);

SELECT name
FROM Users
WHERE NOT EXISTS (
    SELECT 1 FROM Enrollments
    WHERE Enrollments.user_id = Users.user_id
);






