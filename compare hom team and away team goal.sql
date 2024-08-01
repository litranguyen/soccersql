SELECT
	m.date,
    m.home_team_api_id,
    m.away_team_api_id,
    m.home_team_goal,
    m.away_team_goal
FROM match AS m
LEFT JOIN (
  SELECT match.id, team.team_long_name AS hometeam
  FROM match
  LEFT JOIN team
  ON match.home_team_api_id = team.team_api_id) AS home
ON home.id = m.id
LEFT JOIN (
  SELECT match.id, team.team_long_name AS awayteam
  FROM match
  LEFT JOIN team
  ON match.away_team_api_id = team.team_api_id) AS away
ON away.id = m.id;