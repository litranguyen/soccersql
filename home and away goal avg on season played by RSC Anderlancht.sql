SELECT
	date,
	season,
	home_team_goal,
	away_team_goal,
	CASE WHEN home_team_api_id = 8635 THEN 'home' 
		 ELSE 'away' END AS warsaw_location,
    AVG(home_team_goal) OVER(PARTITION BY season) AS season_homeavg,
    AVG(away_team_goal) OVER(PARTITION BY season) AS season_awayavg
FROM match
WHERE 
	home_team_api_id = 8635 
    OR away_team_api_id = 8635
ORDER BY (home_team_goal + away_team_goal) DESC;