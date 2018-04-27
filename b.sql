update player set pname = 'Joe Shmo' where jerseynum > 2 AND jerseynum < 5;
insert into coach (cname) select pname from player where age > 55;
delete from game where finalscore = '0-0' or location not like '%Lovik%';
insert into coach (cname) select pname from player where position != 'Handler' AND position != 'Cutter';
delete from player where pname NOT LIKE '% %';
