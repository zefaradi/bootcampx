SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%GMAIL.com%'
AND phone is NULL;