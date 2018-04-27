INSERT INTO Player (PName, Age, Gender, Position, JerseyNum, Hometown) VALUES ('Jacob Ochs', 22, 'M', 'Handler', 14, 'Lake Arrowhead');
INSERT INTO Player (PName, Age, Gender, Position, JerseyNum, Hometown) VALUES ('Jessica Smith', 19, 'F', 'Cutter', 55, 'Santa Barbara');
INSERT INTO Player (PName, Age, Gender, Position, JerseyNum, Hometown) VALUES ('Joe Shmo', 67, 'M', 'Cutter', 60, 'Pasadena');
INSERT INTO Player (PName, Age, Gender, Position, JerseyNum, Hometown) VALUES ('Jessica Anderson', 19, 'F', 'Handler', 3, 'Santa Barbara');
INSERT INTO Player (PName, Age, Gender, Position, JerseyNum, Hometown) VALUES ('Jordan Ellis', 24, 'M', 'Cutter', 42, 'Pasadena');
INSERT INTO Player (PName, Age, Gender, Position, JerseyNum, Hometown) VALUES ('Chris Costenbader', 54, 'M', 'Handler', 77, 'Santa Barbara');
INSERT INTO Player (PName, Age, Gender, Position, JerseyNum, Hometown) VALUES ('Mary MotherOfJesus', 78, 'F', 'Handler', 90, 'Bethlehem');
INSERT INTO Player (PName, Age, Gender, Position, JerseyNum, Hometown) VALUES ('Paul TheApostle', 90, 'F', 'Cutter', 21, 'Tarsus');

INSERT INTO Stats (Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES (16, 14, 5, 9, 3, 6, 7, 4);
INSERT INTO Stats (Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES (3, 2, 22, 4, 1, 1, 32, 1);
INSERT INTO Stats (Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES (44, 2, 22, 4, 1, 1, 66, 5);
INSERT INTO Stats (Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES (1, 2, 22, 4, 1, 1, 14, 10);
INSERT INTO Stats (Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES (18, 11, 90, 102, 7, 14, 203, 9);
INSERT INTO Stats (Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES (32, 121, 203, 256, 21, 11, 35, 361);
INSERT INTO Stats (Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES (41, 359, 400, 617, 2, 65, 894, 1);
INSERT INTO Stats (Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES (512, 68, 612, 387, 13, 144, 732, 2);

INSERT INTO Team (TName, League, City, Wins, Losses) VALUES ('Westmont Wildfire', 'D3 Southwest', 'Santa Barbara', 1, 1);
INSERT INTO Team (TName, League, City, Wins, Losses) VALUES ('UCSB Black Tide', 'D1 Southwest', 'Santa Barbara', 2, 4);
INSERT INTO Team (TName, League, City, Wins, Losses) VALUES ('Biblical Heroes', 'D1 MiddleEast', 'Jerusalem', 100, 0);
INSERT INTO Team (TName, League, City, Wins, Losses) VALUES ('ASU Sun Devils', 'D1 Southwest', 'Tempe', 0, 1);

INSERT INTO League (LName, Division, Gender) VALUES ('Southwest', 'D3 College', 'B');
INSERT INTO League (LName, Division, Gender) VALUES ('Western Conference', 'D1 College', 'M');
INSERT INTO League (LName, Division, Gender) VALUES ('D1 MiddleEast', 'D1 Elite', 'B');

INSERT INTO Coach (CName, TName, Phone, Wins, Losses) VALUES ('Steve Rutz', 'Westmont Wildfire', '0123456789', 1, 1);
INSERT INTO Coach (CName, TName, Phone, Wins, Losses) VALUES ('John Smith', 'UCSB Black Tide', '9097871253', 2, 4);
INSERT INTO Coach (CName, TName, Phone, Wins, Losses) VALUES ('Chris Atkinson', 'Westmont Wildfire', '9512898910', 0, 0);
INSERT INTO Coach (CName, TName, Phone, Wins, Losses) VALUES ('Moses', 'Biblical Heroes', '3333333333', 100, 0);

INSERT INTO Game (Location, StartTime, Description, FinalScore) VALUES ('Lovik Field', '2018-03-08 HH10:15:11', 'Mixed Open Tournament 1 - delay 1 hour', '13-11');
INSERT INTO Game (Location, StartTime, Description, FinalScore) VALUES ('Thorrington Field', '2018-03-08 HH10:15:11', 'Mixed Open Tournament 1 - delay 30 minute', '10-13');
INSERT INTO Game (Location, StartTime, Description, FinalScore) VALUES ('Lovik Field', '2018-03-09 HH14:00:00', 'Open Tournament Quarters', '14-13');
INSERT INTO Game (Location, StartTime, Description, FinalScore) VALUES ('Lovik Field', '2018-03-09 HH17:00:00', 'Open Tournamen Semis', '13-8');
INSERT INTO Game (Location, StartTime, Description, FinalScore) VALUES ('Thorrington Field', '2018-03-09 HH14:00:00', 'Open Tournament Quarters - delay 30 minute due to snow', '9-13');
INSERT INTO Game (Location, StartTime, Description, FinalScore) VALUES ('Thorrington Field', '2018-03-09 HH17:00:00', 'Open Tournament Semis - delay 1 hour due to snow', '6-13');
INSERT INTO Game (Location, StartTime, Description, FinalScore) VALUES ('Thorrington Field', '2018-03-10 HH10:12:00', 'Open Tournament Championship', '9-11');

INSERT INTO PlaysFor (PName, TName, League) VALUES ('Jacob Ochs', 'Westmont Wildfire', 'D3 Southwest');
INSERT INTO PlaysFor (PName, TName, League) VALUES ('Jessica Smith', 'UCSB Black Tide', 'D1 Southwest');
INSERT INTO PlaysFor (PName, TName, League) VALUES ('Joe Shmo', 'UCSB Black Tide', 'D1 Southwest');
INSERT INTO PlaysFor (PName, TName, League) VALUES ('Jessica Anderson', 'Westmont Wildfire', 'D3 Southwest');
INSERT INTO PlaysFor (PName, TName, League) VALUES ('Jordan Ellis', 'Westmont Wildfire', 'D3 Southwest');
INSERT INTO PlaysFor (PName, TName, League) VALUES ('Chris Costenbader', 'Westmont Wildfire', 'D3 Southwest');
INSERT INTO PlaysFor (PName, TName, League) VALUES ('Mary MotherOfJesus', 'Biblical Heroes', 'D1 MiddleEast');
INSERT INTO PlaysFor (PName, TName, League) VALUES ('Paul TheApostle', 'Biblical Heroes', 'D1 MiddleEast');

INSERT INTO Records (PName, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Jacob Ochs', 2, 22, 6, 23, 0, 1, 1, 1);
INSERT INTO Records (PName, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Jessica Smith', 3, 2, 22, 4, 1, 1, 32, 1);
INSERT INTO Records (PName, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Joe Shmo', 1, 2, 22, 4, 1, 1, 14, 10);
INSERT INTO Records (PName, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Jessica Anderson', 44, 2, 22, 4, 1, 1, 66, 5);
INSERT INTO Records (PName, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Jordan Ellis', 18, 11, 90, 102, 7, 14, 203, 9);
INSERT INTO Records (PName, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Chris Costenbader', 32, 121, 203, 256, 21, 11, 35, 361);
INSERT INTO Records (PName, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Mary MotherOfJesus', 41, 359, 400, 617, 2, 65, 894, 1);
INSERT INTO Records (PName, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Paul TheApostle', 512, 68, 612, 387, 13, 144, 732, 2);

INSERT INTO Participates (PName, Location, StartTime) VALUES ('Jacob Ochs', 'Lovik Field', '2018-03-08 HH10:15:11');
INSERT INTO Participates (PName, Location, StartTime) VALUES ('Jessica Smith', 'Lovik Field', '2018-03-08 HH10:15:11');
INSERT INTO Participates (PName, Location, StartTime) VALUES ('Joe Shmo', 'Lovik Field', '2018-03-08 HH10:15:11');
INSERT INTO Participates (PName, Location, StartTime) VALUES ('Chris Costenbader', 'Lovik Field', '2018-03-08 HH10:15:11');
INSERT INTO Participates (PName, Location, StartTime) VALUES ('Jordan Ellis', 'Lovik Field', '2018-03-08 HH10:15:11');
INSERT INTO Participates (PName, Location, StartTime) VALUES ('Jessica Anderson', 'Lovik Field', '2018-03-08 HH10:15:11');

INSERT INTO CompetesIn (TName, League, Location, StartTime) VALUES ('Westmont Wildfire', 'D3 Southwest', 'Lovik Field', '2018-03-08 HH10:15:11');
INSERT INTO CompetesIn (TName, League, Location, StartTime) VALUES ('UCSB Black Tide', 'D1 Southwest', 'Lovik Field', '2018-03-08 HH10:15:11');

INSERT INTO Organizes (TName, League, LName) VALUES ('Westmont Wildfire', 'D3 College', 'D3 Southwest');
INSERT INTO Organizes (TName, League, LName) VALUES ('UCSB Black Tide', 'D1 College', 'D1 Southwest');
INSERT INTO Organizes (TName, League, LName) VALUES ('Biblical Heroes', 'D1 Elite', 'D1 MiddleEast');

INSERT INTO Trains (CName, TName, League) VALUES ('Steve Rutz', 'Westmont Wildfire', 'D3 Southwest');
INSERT INTO Trains (CName, TName, League) VALUES ('John Smith', 'UCSB Black Tide', 'D1 Southwest');
INSERT INTO Trains (CName, TName, League) VALUES ('Chris Atkinson', 'Westmont Wildfire', 'D1 Southwest');
INSERT INTO Trains (CName, TName, League) VALUES ('Moses', 'Bibical Heroes', 'D1 MiddleEast');

INSERT INTO Increments (Location, StartTime, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Lovik Field','2018-03-08 HH10:15:11', 3, 2, 22, 4, 1, 1, 32, 1);
INSERT INTO Increments (Location, StartTime, Goals, Assists, Catches, Completions, Turnovers, Blocks, PointsPlayed, UnforcedErrors) VALUES ('Lovik Field','2018-03-08 HH10:15:11', 3, 2, 22, 4, 1, 1, 32, 1);
