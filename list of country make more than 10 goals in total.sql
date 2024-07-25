SELECT
	c.name  AS country_name,
	COUNT(sub.id) AS matches
FROM Country AS c
INNER JOIN (SELECT country_id,id
							FROM Match
							WHERE (home_team_goal + away_team_goal) >= 10) AS sub
ON c.id = sub.country_id
GROUP BY country_name;
