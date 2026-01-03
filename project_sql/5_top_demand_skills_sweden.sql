/*
QUESTION: What are the most  in-demand skills for data/business analysts in Sweden?
- Identify the top 5 in-demand skills for data/business analysts
- Focus on the Swedish job market
- Why? Retrieves the top 5 skills with the highest demand in the Swedish job market, providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(sjd.job_id) AS demand_count
FROM
    job_postings_fact AS jpf
INNER JOIN
    skills_job_dim AS sjd ON
    sjd.job_id = jpf.job_id
INNER JOIN
    skills_dim AS sd ON
    sd.skill_id = sjd.skill_id
WHERE
    (job_title LIKE '%Data Analyst%' OR
    job_title LIKE '%Business Analyst%') AND
    job_country = 'Sweden'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*

Result:
* SQL - 532
* Python - 369
* Power BI - 220
* Tableau - 210
* R - 199

- SQL and Python are the outliers
- Power BI and Tableau seems rather close for visulasation
- R makes the list in Sweden and Excel misses out

*/