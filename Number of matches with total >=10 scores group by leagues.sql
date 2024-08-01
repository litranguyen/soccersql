WITH match_list AS (
	SELECT	
		country_id,
		id
	FROM Match
	WHERE (home_team_goal+away_team_goal) >=10)
SELECT 
	l.name AS League,
	COUNT(match_list.id) AS matches
FROM League AS l
LEFT JOIN match_list ON l.country_id =match_list.country_id
GROUP BY l.name;