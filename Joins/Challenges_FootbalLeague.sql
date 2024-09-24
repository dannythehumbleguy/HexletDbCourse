-- noinspection SqlNoDataSourceInspectionForFile

SELECT t1.name AS home_team, t2.name AS away_team FROM teams AS t1
CROSS JOIN teams AS t2
WHERE NOT t1.Id = t2.Id
ORDER BY t1.name, t2.name;
