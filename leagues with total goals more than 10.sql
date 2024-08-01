WITH match_list AS (
	SELECT 
		name AS league,
		date,
		m.home_team_goal,
		m.away_team_goal, 
		(m.home_team_goal+m.away_team_goal) AS total_goals
	FROM match as m
	LEFT JOIN league as l on m.country_id=l.id)
SELECT league,date, home_team_goal,away_team_goal
FROM match_list
WHERE total_goals >=10;