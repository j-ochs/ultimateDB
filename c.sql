\echo 'View 1: All players who are teenager and whose hometown is Santa Barbara'
CREATE VIEW teenagePlayersSB as select * from player where hometown = 'Santa Barbara' AND age > 12 AND age < 20;
\echo 'View 1 Query: all from view1 whose gender is female OR position is cutter'
SELECT * from teenagePlayersSB where gender = 'F' OR position = 'Cutter';

\echo 'View 2: All players whose statistics show they proficient handlers'
CREATE VIEW bestHandlers as select * from records where assists > goals and completions > turnovers and completions > catches;
\echo 'View 2 Query: All players across view2 who also play for Westmont Wildfire'
SELECT bestHandlers.pname, playsfor.tname from bestHandlers, playsfor where bestHandlers.pname = playsfor.pname and playsfor.tname = 'Westmont Wildfire';

\echo 'drop both views'
drop view teenagePlayersSB;
drop view bestHandlers;
