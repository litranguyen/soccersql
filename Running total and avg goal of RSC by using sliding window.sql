SELECT 
	date, 
	home_team_goal,
	away_team_goal,
	SUM(home_team_goal) OVER (ORDER BY date ROWS between UNBOUNDED PRECEDING and CURRENT ROW) AS Running_total,
	AVG(home_team_goal) OVER (ORDER BY date ROWS between UNBOUNDED PRECEDING and CURRENT ROW) AS Running_avg
FROM match 
WHERE home_team_api_id = 8635 OR away_team_api_id =8635;