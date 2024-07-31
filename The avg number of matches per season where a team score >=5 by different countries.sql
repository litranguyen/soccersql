SELECT
	c.name AS country,
    AVG(outer_s.matches) AS avg_seasonal_high_scores
FROM country AS c
LEFT JOIN (
  SELECT country_id, season,
         COUNT(id) AS matches
	FROM (
		SELECT country_id, season, id
		FROM match
		WHERE home_team_goal >= 5 OR away_team_goal >= 5) AS inner_s
  GROUP BY country_id, season) AS outer_s
ON c.id = outer_s.country_id
GROUP BY country;