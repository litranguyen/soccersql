SELECT 
	main.country_id,
    main.date,
    main.home_team_goal,
    main.away_team_goal
FROM match AS main
WHERE 
	(home_team_goal + away_team_goal) =
        (SELECT max(sub.home_team_goal + sub.away_team_goal)
         FROM match AS sub
         WHERE main.country_id = sub.country_id
               AND main.season = sub.season);