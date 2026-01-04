/*
QUESTION: What are the top skills based on salary, for remote jobs?
- Look at the average salary associated with each skill for Data/Business Analyst positions.
- Focus on roles with specified salaries, and filter on remote jobs.
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
--    COUNT (sjd.job_id) AS demand_count,
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
    job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    avg_salary_skill DESC
LIMIT 25;

/*
🌐 Top 3 Insights from Remote Analyst Job Skills

💻 Full-Stack & Front-End Skills Boost Remote Analyst Salaries
Skills like CSS, Angular, FastAPI, and Bitbucket suggest top-paying remote roles favor analysts who can interface with product/dev teams and contribute to web-facing data applications.

🤖 Machine Learning & Deep Learning Tools Dominate the Top Tier
High-paying remote roles often list tools like Keras, PyTorch, TensorFlow, Jupyter, and Pandas, indicating a strong demand for analysts who can support or prototype ML/AI workflows from a distance.

☁️ Cloud-Native & Scalable Data Systems Are Highly Valued
Tools such as Kafka, Cassandra, Elasticsearch, and Couchbase show that remote analysts are expected to work within or alongside modern, distributed data infrastructure — not just traditional BI stacks.

[
  {
    "skills": "bitbucket",
    "avg_salary_skill": "189154.50"
  },
  {
    "skills": "css",
    "avg_salary_skill": "185000.00"
  },
  {
    "skills": "keras",
    "avg_salary_skill": "185000.00"
  },
  {
    "skills": "fastapi",
    "avg_salary_skill": "185000.00"
  },
  {
    "skills": "angular",
    "avg_salary_skill": "185000.00"
  },
  {
    "skills": "golang",
    "avg_salary_skill": "161750.00"
  },
  {
    "skills": "watson",
    "avg_salary_skill": "160515.00"
  },
  {
    "skills": "couchbase",
    "avg_salary_skill": "160515.00"
  },
  {
    "skills": "gitlab",
    "avg_salary_skill": "154500.00"
  },
  {
    "skills": "pyspark",
    "avg_salary_skill": "150257.50"
  },
  {
    "skills": "swift",
    "avg_salary_skill": "147833.33"
  },
  {
    "skills": "elasticsearch",
    "avg_salary_skill": "145000.00"
  },
  {
    "skills": "jupyter",
    "avg_salary_skill": "143375.00"
  },
  {
    "skills": "flask",
    "avg_salary_skill": "142000.00"
  },
  {
    "skills": "pytorch",
    "avg_salary_skill": "140000.00"
  },
  {
    "skills": "kafka",
    "avg_salary_skill": "140000.00"
  },
  {
    "skills": "tensorflow",
    "avg_salary_skill": "140000.00"
  },
  {
    "skills": "cassandra",
    "avg_salary_skill": "140000.00"
  },
  {
    "skills": "rust",
    "avg_salary_skill": "138000.00"
  },
  {
    "skills": "numpy",
    "avg_salary_skill": "137393.75"
  },
  {
    "skills": "linux",
    "avg_salary_skill": "136507.50"
  },
  {
    "skills": "scala",
    "avg_salary_skill": "133835.83"
  },
  {
    "skills": "pandas",
    "avg_salary_skill": "132936.25"
  },
  {
    "skills": "microstrategy",
    "avg_salary_skill": "130184.63"
  },
  {
    "skills": "zoom",
    "avg_salary_skill": "129348.00"
  }
]
*/