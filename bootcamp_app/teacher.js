const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'labber'
});

console.log("connected");

const queryString = `SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.*) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`;

const cohortName = process.argv[2];
const values = [`%${cohortName}%`];

pool.query(queryString, values).then(res => {
  res.rows.forEach(item => {
    console.log(`${item.cohort}: ${item.teacher}`);
  })
});