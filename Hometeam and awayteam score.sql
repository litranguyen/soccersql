SELECT	
	m.date,
	(SELECT team_long_name
	FROM team AS t
	WHERE t.team_api_id = m.home_team_api_id) AS hometeam,
	(SELECT team_long_name
	FROM team AS t
	WHERE t.team_api_id = m.away_team_api_id) AS awayteam,
	home_team_goal,
	away_team_goal
FROM match AS m;