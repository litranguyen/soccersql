SELECT
	season,
    max(home_team_goal + away_team_goal) AS max_goals,
   (SELECT max(home_team_goal + away_team_goal) FROM match) AS overall_max_goals,
   (SELECT max(home_team_goal + away_team_goal) 
    FROM match
    WHERE id IN (
          SELECT id FROM match WHERE EXTRACT (MONTH FROM date = 10)) AS oct_max_goals
FROM match
GROUP BY season;