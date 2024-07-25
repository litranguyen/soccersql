SELECT 
	l.name AS league,
	ROUND (AVG(m.home_team_goal + m.away_team_goal),2) AS avg_goals,
	ROUND(AVG(m.home_team_goal + m.away_team_goal) - 
		(SELECT AVG(home_team_goal + away_team_goal)
		FROM Match
		WHERE season = '2014/2015'),2) AS diff
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
WHERE season = '2014/2015'
GROUP BY l.name;