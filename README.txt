-----------------------------------
Jacob Ochs
CS-125 : Database Design
April 24, 2018
Project 5
Acknowledgements: none
------------------------------------
WEB INTERFACE URL: http://vmwardrobe.westmont.edu/~jochs128


Submission Manifest:

	- public_html (directory of php files)
		- index.php : home web interface for interaction with database
		- addplayer.php : web interface for adding players to database with contraints.
		- coaches.php : web interface for viewing coach table.
		- delete.php : web interface for deleting players from database while enforcing
				primary key constraints between tables.
		- games.php : web interface for viewing game table, as well as updating starttime
				via a conditional function call.
		- homegrown.php : web interface for interesting query where players have same
				hometown as the team which they play for.
		- leaguechamp.php : web interface for displaying unique champion team for each league
		- players.php : web interface for viewing player roster
		- stats.php : web interface for viewing stats for each player, as well as 
				ability to sort results table based on each statistic
		- teams.php : web interface for viewing team table

		
	- triggerfunctions.sql
		Contains PL/pgSQL trigger and functions with documentation as described in project specs.
		Functions: retired() - adds new 'retired' player to new Retirees relation
			   delayedGame() - checks for delayed games and updates attributes accordingly.
		Trigger:   retiredTrig - fires on update or insert to Player relation.
	- a.sql
		Contains 5 SQL queries to reflect the purpose of the database.

	- b.sql
		Contains 5 SQL data modifications.

	- c.sql
		Contains 2 SQL views with related queries on each view.

	- d.sql
		Contains SQL index creation and deletion statements.

	- createschema.sql
		SQL commands for creation of all tables, with modified constraints and keys as follows:
		- Player: primary key PName. Non-negative constraint checks on Age and
		    JerseyNum attributes, constraint check on Gender attribute for 'M' or 'F'.
		- Stats: no primary key. Non-negative constraint checks on all attributes.
		- Team: primary key (TName, League). Non-negative tuple-based constraint check on Wins and Losses.
		- League: primary key LName. Constraint check on Gender attribute for 'M', 'F', or 'B'.
		- Coach: primary key CName. Non-negative tuple-based constraint check on Wins and Losses.
		- Game: primary key (Location, StartTime).
		- PlaysFor: foreign key on Player(PName).
		- Records: foreign key on Player(PName).

	- dropschema.sql
		Drops all tables created from createschema.sql.

	- popoulatesmall.sql
		Fills ~8 rows of every table with data representative of its use case.

	- populatelarge.sql
		Fills a large amount of dummy data in every table from existing csv files.

	- jochsP4ProposalER.pdf
		Database proposal and ER Diagram originating from project part 1.

	- dummyData.py
		Python script for creation of dummy data for use in populatelarge.sql.
		Uses faker.py module to create data, writing data for each table to distinct csv's.
		Amount of data populated for each table is defined in variables at top of script.
		Command to run: python3 dummyData.py


	Dummy Data CSVs - format: <tableName>Fake.csv
	- playerFake.csv
	- statsFake.csv
	- teamFake.csv
	- leagueFake.csv
	- coachFake.csv
	- gameFake.csv
	- playsForFake.csv
	- recordsFake.csv
	- participatesFake.csv
	- competesIn.csv
	- organizesFake.csv
	- trainsFake.csv
	- incrementsFake.csv

