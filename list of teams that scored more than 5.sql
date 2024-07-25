SELECT
	team_long_name,team_short_name
FROM Team
WHERE team_api_id  IN (SELECT DISTINCT home_team_api_id 
													FROM match
													WHERE home_team_goal>= '5'	);