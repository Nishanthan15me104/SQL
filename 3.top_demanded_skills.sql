with remote_job_skills as (

select 
    skill_id,
    count(*) as skill_count
from
    skills_job_dim as skills_to_job
inner join job_postings_fact as job_posting on job_posting.job_id = skills_to_job.job_id
where 
    job_posting.job_work_from_home =true and
    job_posting.job_title_short ='Data Analyst'
group by
    skill_id
    )
select 
        skills.skill_id, 
        skills as skill_name,
        skill_count
from remote_job_skills
inner join skills_dim as skills on skills.skill_id=remote_job_skills.skill_id
order BY
    skill_count DESC
    limit 5