SELECT 
	l.name AS league,
    AVG(m.home_team_goal + m.away_team_goal) AS avg_goals,
    RANK ()OVER (ORDER BY AVG(m.home_team_goal + m.away_team_goal)) AS league_rank
FROM league AS l
LEFT JOIN match AS m 
ON l.id = m.country_id
WHERE m.season = '2013/2014'
GROUP BY l.name
ORDER BY league_rank;