\echo 'Initial 5 queries without any indexes'
explain analyze select pname, tname from playsfor where exists (select pname, unforcederrors from records order by unforcederrors DESC) limit 10;
explain analyze select distinct on (league) league, tname, wins, losses from team order by league, wins DESC, losses ASC limit 10;
explain analyze select pname, goals, pointsplayed from records order by goals DESC, pointsplayed ASC limit 10;
explain analyze select player.pname, player.hometown, playsfor.tname as teamname, team.city as teamcity from player, team, playsfor where player.pname = playsfor.pname and playsfor.tname = team.tname and player.hometown = team.city;
explain analyze select distinct on (tname) tname, pname, age from (select player.pname, player.age, playsfor.tname from player inner join playsfor on (player.pname = playsfor.pname) order by age DESC) as test limit 10;

\echo 'index creation for keys'
create index playerkey on player(pname);
create index teamkey on team(tname, league);
create index leaguekey on league(lname);
create index coachkey on coach(cname);
create index gamekey on game(location, starttime);
create index playsforTname on playsfor(tname);


\echo '2 custom indexes created'
create index playsforPname ON playsfor(pname);
create index playerage on player(age);

\echo '5 queries again with indexes'
explain analyze select pname, tname from playsfor where exists (select pname, unforcederrors from records order by unforcederrors DESC) limit 10;
explain analyze select distinct on (league) league, tname, wins, losses from team order by league, wins DESC, losses ASC limit 10;
explain analyze select pname, goals, pointsplayed from records order by goals DESC, pointsplayed ASC limit 10;
explain analyze select player.pname, player.hometown, playsfor.tname as teamname, team.city as teamcity from player, team, playsfor where player.pname = playsfor.pname and playsfor.tname = team.tname and player.hometown = team.city;
explain analyze select distinct on (tname) tname, pname, age from (select player.pname, player.age, playsfor.tname from player inner join playsfor on (player.pname = playsfor.pname) order by age DESC) as test limit 10;

\echo 'drop all indexes'
drop index playerkey;
drop index teamkey;
drop index leaguekey;
drop index coachkey;
drop index gamekey;
drop index playsforTname;
drop index playsforPname;
drop index playerage;
