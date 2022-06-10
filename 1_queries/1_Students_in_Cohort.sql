SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name;

SELECT students.name as student_name, cohorts.name as cohort_name, cohorts.start_date as cohort_start_date, students.start_date as student_start_date
FROM cohorts JOIN students ON cohort_id = cohorts.id
WHERE cohort_start_date <> student_start_date;