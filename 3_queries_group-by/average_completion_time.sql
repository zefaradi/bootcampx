SELECT students.name as student, AVG(assignment_submissions.duration) AS average_assignment_duration
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.id
WHERE students.end_date is NULL
GROUP BY student
ORDER BY AVG(assignment_submissions.duration) DESC;