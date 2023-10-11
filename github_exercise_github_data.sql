CREATE TABLE github(
    topic VARCHAR(255),
    user_name VARCHAR(255),
    repo_name VARCHAR(255),
    repo_link VARCHAR(255),
    star_count INT);
    
COPY github
FROM 'github_data.csv'
WITH (FORMAT CSV,HEADER);
--return all data
SELECT * FROM github;

--return a list of the topics on github (no duplicates)
SELECT DISTINCT topic FROM github;

--return the repo_name and star_count from largest to smallest
SELECT repo_name, star_count FROM github
ORDER BY star_count DESC;

--return a list of topics in alphabetical order (no duplicates)

SELECT DISTINCT topic FROM github
ORDER BY topic ASC;

--return all repo_names that have a star_count greater than 2000

SELECT repo_name FROM github
WHERE star_count > 2000;

/*return all repo_names that have a star_count > than 3000
and are in the 3d topic */

SELECT repo_name FROM github
WHERE star_count > 3000 AND topic = '3d';

/*return all repo_names that are in the aws, azure, or chrome 
topics and that have a star_count less than 1000*/

SELECT repo_name FROM github
WHERE topic IN ('aws', 'azure', 'chrome')
AND star_count < 1000;

/*return the user_name, repo_name, and repo_link where the
repo_link contains ‘ext’ (note this is NOT case sensitive) */

SELECT user_name, repo_name, repo_link FROM github
WHERE repo_link ILIKE '%ext%';

--return all columns for chrome topics w/ star_count is >5000

SELECT * FROM github
WHERE topic = 'chrome' AND star_count > 5000;

/*return all the user_name and respective repo_name where the
star_count is greater than 1000 and less than 15000*/

SELECT user_name, repo_name FROM github
WHERE star_count > 1000 AND star_count < 15000;

/*return an alphabetical list of user_names who have repos with
star_counts of higher than 15000 (no duplicates)*/

SELECT DISTINCT user_name FROM github
WHERE star_count > 15000
ORDER BY user_name;

/*return a list of user_names that start with ‘Add’ or end with ‘on’ 
(Note this IS case sensitive). (no Duplicates)*/

SELECT DISTINCT user_name FROM github
WHERE user_name LIKE 'Add%' OR user_name LIKE '%on';

/*return an alphabetical list of topics that have at least one repo with a
star_count greater than 100,000 (no duplicates)*/

SELECT DISTINCT topic FROM github
WHERE star_count > 100000
ORDER BY topic;

/*returns a list of topics that contain null star_counts (if any exist)
(duplicates allowed)*/

SELECT topic FROM github
WHERE star_count IS NULL;

/*returns a list of topics, user_names, and star_count if the star_count is 
at least 100,000 but no more than 200,000 and whose topic starts with ‘a’*/

SELECT topic, user_name, star_count FROM github
WHERE star_count BETWEEN 100000 AND 200000
AND topic LIKE 'a%';


