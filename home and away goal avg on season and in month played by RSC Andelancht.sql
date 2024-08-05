SELECT 
	date,
	season,
	home_team_goal,
	away_team_goal,
	CASE WHEN hometeam_id = 8635 THEN 'home' 
         ELSE 'away' END AS warsaw_location,
    AVG(home_team_goal) OVER(PARTITION BY season, 
         	EXTRACT(month FROM date)) AS season_mo_home,
    AVG(away_team_goal) OVER(PARTITION BY season, 
            EXTRACT(month FROM date)) AS season_mo_away
FROM match
WHERE 
	hometeam_id = 8635
    OR awayteam_id = 8635
ORDER BY (home_team_goal + away__team_goal) DESC;