SELECT
    country,
    date,
    home_team_goal,
    away_team_goal
FROM 
	(SELECT c.name AS country, 
     	    m.date, 
     		m.home_team_goal, 
     		m.away_team_goal,
           (m.home_team_goal + m.away_Team_goal) AS total_goals
    FROM match AS m
    LEFT JOIN country AS c
    ON m.country_id = c.id) AS subq
WHERE total_goals >=10 ;