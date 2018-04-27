-- add new 'retired' player to Retirees table.
CREATE OR REPLACE FUNCTION
		retired() RETURNS Trigger AS $$
	DECLARE
		plr Player.PName%TYPE;
		yrs Player.Age%TYPE;
		posn Player.Position%TYPE;
		--Only execute cursor for Players who are retirement age
		c CURSOR FOR
			select PName, p.Age, Position from Player p LEFT JOIN Retirees r on p.PName = r.Name 
			WHERE p.Age > 60 AND r.name IS NULL;

BEGIN
	--Create new Retirees table if it does not exist already
	CREATE TABLE IF NOT EXISTS public.Retirees (Name varchar(255) PRIMARY KEY, Age integer);
	OPEN c;
	LOOP
		FETCH c INTO plr, yrs, posn;
		EXIT WHEN NOT FOUND;
		--Players who play Handler position must be older than 70 to retire
		IF yrs > 70 AND posn = 'Handler' THEN
			RAISE NOTICE 'Adding Retired Handler: %, Age %', plr, yrs;
			--Print local variables and insert them into Retirees relation
			INSERT INTO Retirees VALUES (plr, yrs);
		END IF;

		--Players who play Cutter position must be older than 60 to retire
		IF yrs > 60 AND posn = 'Cutter' THEN
			RAISE NOTICE 'Adding Retired Cutter: %, Age %', plr, yrs;
			--Print local variables and insert them into Retirees relation
			INSERT INTO Retirees VALUES (plr, yrs);
		END IF;

	END LOOP;
	CLOSE c;
	RETURN NEW;
END; $$ LANGUAGE 'plpgsql';



--checks for delayed games and updates their attributes accordingly
--this approach is not scalable, but serves to demonstrate functionality of pl/pgsql
CREATE OR REPLACE FUNCTION
	delayedGame() RETURNS int AS $$

	BEGIN
		--check if there are delayed games
		IF EXISTS (SELECT Description, StartTime from Game where Description LIKE '%delay%') THEN
			RAISE NOTICE 'Updating StartTime';
			
			--update starttime and description for 1 hour delays
			UPDATE Game set StartTime = StartTime + interval '1 hour'
			where Description LIKE '%1 hour%';
			UPDATE GAME set Description = 
			REPLACE(Game.Description, 'delay 1 hour', 'starttime updated') where Description LIKE '%1 hour%';

			--update starttime and description for 30 minute delays
			UPDATE Game set StartTime = StartTime + interval '30 minute'
			where Description LIKE '%30 minute%';
			UPDATE GAME set Description = 
			REPLACE(Game.Description, 'delay 30 minute', 'starttime updated') where Description LIKE '%30 minute%';

		END IF;
	RAISE NOTICE 'end of function';
	RETURN 1;
END; $$ LANGUAGE 'plpgsql';


--retired player triggered on change to Player relation
CREATE TRIGGER retiredTrig
	AFTER INSERT OR UPDATE ON Player
	FOR EACH ROW
	EXECUTE PROCEDURE retired();



