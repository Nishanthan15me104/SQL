with top_paying_jobs as( select
    job_id, job_title,
    job_schedule_type,
    salary_year_avg
    ,name as company_name
 from 
    job_postings_fact as a
Left Join company_dim as b 
on a.company_id=b.company_id
where 
    job_title_short='Data Analyst' and 
    job_location='Anywhere' AND
    salary_year_avg IS NOT NULL
    order by salary_year_avg DESC)

select 
a.*,
skills 
from top_paying_jobs as a
inner join skills_job_dim as b on a.job_id=b.job_id
inner join skills_dim as c on b.skill_id=c.skill_id
order by salary_year_avg desc
limit 10


/*
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "excel"
  }
]
*/


