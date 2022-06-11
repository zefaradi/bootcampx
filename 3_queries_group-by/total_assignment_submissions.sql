SELECT cohorts.name as cohort, count(assignment_submissions.*) AS total_submissions
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON cohorts.id = assignment_submissions.id
GROUP BY cohort
ORDER BY count(assignment_submissions.*) DESC;