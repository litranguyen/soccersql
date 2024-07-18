SELECT 
	date,
	-- Identify the home team as Barcelona or Real Madrid
	CASE when home_team_api_id = 8634 then 'FC Barcelona' 
        else 'Real Madrid CF' end AS home,
    -- Identify the away team as Barcelona or Real Madrid
	CASE when away_team_api_id = 8634 then 'FC Barcelona' 
        else 'Real Madrid CF' end as  away
FROM Match
WHERE (away_team_api_id = 8634 OR home_team_api_id = 8634)
      AND (away_team_api_id = 8633 OR home_team_api_id = 8633);