select  
    skills,
   round(avg(salary_year_avg),0) as averaGE_SALARY
from job_postings_fact as a
inner join skills_job_dim as b on a.job_id=b.job_id
inner join skills_dim as c on b.skill_id=c.skill_id
where 
    job_title_short='Data Scientist'    
    and salary_year_avg is NOT NULL 
    --job_work_from_home = true
group by 
    skills
Order BY
    averaGE_SALARY DESC
    limit 25
/*
[
  {
    "skills": "asana",
    "average_salary": "215477"
  },
  {
    "skills": "airtable",
    "average_salary": "201143"
  },
  {
    "skills": "redhat",
    "average_salary": "189500"
  },
  {
    "skills": "watson",
    "average_salary": "187417"
  },
  {
    "skills": "elixir",
    "average_salary": "170824"
  },
  {
    "skills": "lua",
    "average_salary": "170500"
  },
  {
    "skills": "slack",
    "average_salary": "168219"
  },
  {
    "skills": "solidity",
    "average_salary": "166980"
  },
  {
    "skills": "ruby on rails",
    "average_salary": "166500"
  },
  {
    "skills": "rshiny",
    "average_salary": "166436"
  }
]
*/