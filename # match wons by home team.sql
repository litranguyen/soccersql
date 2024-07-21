-- goal is summarize the number of matches won by home team
SELECT
	c.name as Country,
	SUM(CASE WHEN m.season = '2013/2014' AND m.home_team_goal > m.away_team_goal
	THEN 1 ELSE 0 END) AS  Match_2013_2014,
	SUM(CASE WHEN m.season = '2014/2015' AND m.home_team_goal > m.away_team_goal
	THEN 1 ELSE 0 END) AS  Match_2014_2015,
	SUM(CASE WHEN m.season = '2015/2016' AND m.home_team_goal > m.away_team_goal
	THEN 1 ELSE 0 END) AS  Match_2015_2016
FROM Country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
GROUP BY c.name;
