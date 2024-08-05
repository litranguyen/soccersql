SELECT
	m.id,
	c.name AS Country,
	m.season,
	m.home_team_goal,
	m.away_team_goal,
	AVG(m.home_team_goal +m.away_team_goal) AS overall_avg
FROM match as m
LEFT JOIN country AS c ON m.country_id=c.id;

