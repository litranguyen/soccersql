WITH home AS (
	SELECT m.id, m.date,
		t.team_long_name AS hometeam, m.home_team_goal
	FROM match AS m
	LEFT JOIN team AS t
	ON m.home_team_api_id = t.team_api_id),
away AS (
	SELECT m.id , m.date,
		t.team_long_name AS awayteam, m.away_team_goal
		FROM match AS m
		LEFT JOIN team AS t
		ON m.away_team_api_id = t.team_api_id)
SELECT 
	home.date,
		home.hometeam,
		away.awayteam,
		home.home_team_goal,
		away.away_team_goal
FROM home
INNER JOIN away
ON home.id = away.id;

	