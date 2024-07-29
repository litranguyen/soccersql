SELECT	
	m.stage,
	ROUND (AVG(m.home_team_goal +m.away_team_goal),2) AS Avg_goals,
	ROUND((SELECT AVG(home_team_goal+ away_team_goal) 
					FROM Match
					WHERE season = '2014/2015'),2) AS overall
FROM match AS m 
Where season = '2014/2015'
GROUP BY m.stage;