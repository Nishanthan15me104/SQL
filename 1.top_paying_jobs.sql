
select
    job_id, job_title,job_location, 
    job_schedule_type,salary_year_avg,job_posted_date
    ,name as company_name
 from 
    job_postings_fact as a
Left Join company_dim as b 
on a.company_id=b.company_id
where 
    job_title_short='Data Scientist' and 
    job_location='Anywhere' AND
    salary_year_avg IS NOT NULL
    order by salary_year_avg DESC


limit 10
