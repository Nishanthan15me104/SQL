
With skills_demand as (select  
    c.skills,
    c.skill_id,
    count(b.job_id) as demand_count
from job_postings_fact as a
inner join skills_job_dim as b on a.job_id=b.job_id
inner join skills_dim as c on b.skill_id=c.skill_id
where 
    job_title_short='Data Scientist'    and 
    salary_year_avg is NOT NULL 
    --job_work_from_home = true
group by 
    c.skill_id
), average_salary as ( select  
    b.skill_id,
   round(avg(salary_year_avg),0) as averaGE_SALARY
from job_postings_fact as a
inner join skills_job_dim as b on a.job_id=b.job_id
inner join skills_dim as c on b.skill_id=c.skill_id
where 
    job_title_short='Data Scientist'    
    and salary_year_avg is NOT NULL 
    --job_work_from_home = true
group by 
    b.skill_id
)
select
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    averaGE_SALARY
from
    skills_demand 
Inner join average_salary 
on skills_demand.skill_id=average_salary.skill_id
order by 
    demand_count DESC,
    averaGE_SALARY desc

    /* to do inner join without CTE */ 