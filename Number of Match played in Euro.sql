SELECT
	c.name AS country,
	COUNT (CASE WHEN m.season = '2012/2013' THEN m.id ELSE NULL END) AS match_2012_2013
FROM Country AS c
LEFT JOIN Match AS m
On c.id = m.country_id
Group By country;