\echo 'Query 1: select player with most unforced errors from each team'
select pname, tname from playsfor where exists (select pname, unforcederrors from records order by unforcederrors DESC) limit 10;

\echo 'Query 2: select champion (winningest team with fewest losses) for each league'
select distinct on (league) league, tname, wins, losses from team order by league, wins DESC, losses ASC limit 10;

\echo 'Query 3: select top 10 players with most goals and from this, with least points played'
select pname, goals, pointsplayed from records order by goals DESC, pointsplayed ASC limit 10;

\echo 'Query 4: select player(s) whose hometown is same as a team''s home city'
select player.pname, player.hometown, playsfor.tname as teamname, team.city as teamcity from player, team, playsfor where player.pname = playsfor.pname and playsfor.tname = team.tname and player.hometown = team.city;

\echo 'Query 5: select oldest player from each distinct team'
select distinct on (tname) tname, pname, age from (select player.pname, player.age, playsfor.tname from player inner join playsfor on (player.pname = playsfor.pname) order by age DESC) as test limit 10;

