/*
QUESTION: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill) for a data/business analyst?
- Identify skills in high demand and associated with high average salaries for Data/Business Analyst roles.
- Filter it positions on the Swedish market whith specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), offering strategic insights for career development in data analysis
*/

SELECT
    skills,
    COUNT (sjd.job_id) AS demand_count,
    ROUND(AVG(jpf.salary_year_avg), 2) AS avg_salary_skill
FROM
    job_postings_fact AS jpf
INNER JOIN
    skills_job_dim AS sjd ON
    sjd.job_id = jpf.job_id
INNER JOIN
    skills_dim AS sd ON
    sd.skill_id = sjd.skill_id
WHERE
    (jpf.job_title LIKE '%Data Analyst%' or
    jpf.job_title LIKE '%Business Analyst%') AND
    jpf.salary_year_avg IS NOT NULL AND
    job_country = 'Sweden'
GROUP BY
    skills
ORDER BY
    avg_salary_skill DESC,
    avg_salary_skill DESC  
LIMIT 25;

/*

Note:
From the results we can see that the job representation in Sweden with salaries are to low, we noted this in our first query already but I wanted to see if we could get the skills. From my personal experience we are not putting the salaries in the job postings, because we want to negotiate the pay. I am going to make a new project that scans the general demand on skills instead  but I will keep this here for now.

*/