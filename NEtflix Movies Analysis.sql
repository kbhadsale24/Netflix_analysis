use netflix_analysis;
-- 1. List all movies released in a specific year (e.g., 2020)
SELECT title, release_year, duration
FROM netflix_titles
WHERE type = 'Movie' AND release_year = 2020;

-- 2. Find all TV shows from a specific country (e.g., Japan)
SELECT title, country, release_year
FROM netflix_titles
WHERE type = 'TV Show' AND country LIKE '%Japan%';

-- 3. Count how many titles are in each genre
SELECT listed_in AS genre, COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY listed_in
ORDER BY total_titles DESC;

-- 4. List all titles added to Netflix in a specific month and year (e.g., September 2021)
SELECT title, type, date_added
FROM netflix_titles
WHERE date_added LIKE 'September%2021%';

-- 5. Find the longest movie on Netflix
SELECT title, duration
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY duration DESC
LIMIT 1;

-- 6. List all directors who have directed more than one title, along with their titles
SELECT director, COUNT(*) AS total_titles
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
HAVING total_titles > 1
ORDER BY total_titles DESC;

-- 7. Find all titles with a specific word in their description (e.g., "love")
SELECT title, description
FROM netflix_titles
WHERE description LIKE '%love%';

-- Average Movie Duration by Release Year: Analyze how the average duration of movies has changed over the years.
SELECT release_year, AVG(CAST(SUBSTRING(duration, 1, LOCATE(' ', duration) - 1) AS SIGNED)) AS avg_duration
FROM netflix_titles
WHERE type = 'Movie'
GROUP BY release_year
ORDER BY release_year;

--Most Common Genres for Movies vs. TV Shows: Determine which genres are most common for movies and TV shows, respectively.
-- For Movies
SELECT listed_in AS genre, COUNT(*) AS total
FROM netflix_titles
WHERE type = 'Movie'
GROUP BY genre
ORDER BY total DESC
LIMIT 5;

-- For TV Shows
SELECT listed_in AS genre, COUNT(*) AS total
FROM netflix_titles
WHERE type = 'TV Show'
GROUP BY genre
ORDER BY total DESC
LIMIT 5;

-- Top 5 Most Frequent Directors for Movies
SELECT director, COUNT(*) AS total_movies
FROM netflix_titles
WHERE type = 'Movie' AND director IS NOT NULL
GROUP BY director
ORDER BY total_movies DESC
LIMIT 5;

-- Most Common Ratings for Content Added in the Last 5 Years
SELECT rating, COUNT(*) AS total
FROM netflix_titles
WHERE date_added >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY rating
ORDER BY total DESC;

Count of Titles by Country with More Than 10 Titles
SELECT country, COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
HAVING total_titles > 10
ORDER BY total_titles DESC;






