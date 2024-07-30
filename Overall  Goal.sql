SELECT 
	s.stage,
    ROUND(s.avg_goals,2) AS avg_goal,
    (SELECT AVG(home_team_goal + away_team_goal) from match WHERE season = '2012/2013') AS overall_goals
FROM 
	(SELECT
		 stage,
         AVG(home_team_goal + away_team_goal) AS avg_goals
	 FROM match
	 WHERE season = '2014/2015'
	 GROUP BY stage) AS s
WHERE 
	s.avg_goals > (SELECT AVG(home_team_goal + away_team_goal) 
                    FROM match WHERE season = '2014/2015');