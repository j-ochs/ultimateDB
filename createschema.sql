CREATE TABLE Player (
	PName varchar(255) PRIMARY KEY,
	Age integer CHECK (Age > 0),
	Gender char(1) CHECK (Gender = 'M' OR Gender = 'F'),
	Position varchar(255),
	JerseyNum integer CHECK (JerseyNum >= 0 AND JerseyNum < 100),
	Hometown varchar(255)
);

CREATE TABLE Stats (
	Goals integer CHECK (Goals >= 0),
	Assists integer CHECK (Assists >= 0),
	Catches integer CHECK (Catches >= 0),
	Completions integer CHECK (Completions >= 0),
	Turnovers integer CHECK (Turnovers >= 0),
	Blocks integer CHECK (Blocks >= 0),
	PointsPlayed integer CHECK (PointsPlayed >= 0),
	UnforcedErrors integer CHECK (UnforcedErrors >= 0)
);

CREATE TABLE Team (
	TName varchar(255),
	League varchar(255),
	City varchar(255),
	Wins integer,
	Losses integer,
	PRIMARY KEY (TName, League),
	CHECK (Wins > -1 AND Losses > -1)
);

CREATE TABLE League (
	LName varchar(255) PRIMARY KEY,
	Division varchar(255),
	Gender char(1) CHECK (Gender = 'M' OR Gender = 'F' OR Gender = 'B')
);

CREATE TABLE Coach (
	CName varchar(255) PRIMARY KEY,
	TName varchar(255),
	Phone varchar(48),
	Wins integer,
        Losses integer,
	CHECK (Wins > -1 AND Losses > -1)
);

CREATE TABLE Game (
	Location varchar(255),
	StartTime timestamp,
	Description varchar(255) default null,
	FinalScore varchar(48),
	PRIMARY KEY (Location, StartTime)
);

CREATE TABLE PlaysFor (
	PName varchar(255) references Player(PName),
	TName varchar(255),
	League varchar(255)
);

CREATE TABLE Records (
	PName varchar(255) references Player(PName),
	Goals integer CHECK (Goals >= 0),
        Assists integer CHECK (Assists >= 0),
        Catches integer CHECK (Catches >= 0),
        Completions integer CHECK (Completions >= 0),
        Turnovers integer CHECK (Turnovers >= 0),
        Blocks integer CHECK (Blocks >= 0),
        PointsPlayed integer CHECK (PointsPlayed >= 0),
        UnforcedErrors integer CHECK (UnforcedErrors >= 0)
);

CREATE TABLE Participates (
	PName varchar(255),
	Location varchar(255),
	StartTime timestamp
);

CREATE TABLE CompetesIn (
	TName varchar(255),
	League varchar(255),
	Location varchar(255),
	StartTime timestamp
);

CREATE TABLE Organizes (
	TName varchar(255),
	League varchar(255),
	LName varchar(255)
);

CREATE TABLE Trains (
	CName varchar(255),
	TName varchar(255),
	League varchar(255)
);

CREATE TABLE Increments (
	Location varchar(255),
	StartTime timestamp,
	Goals integer CHECK (Goals >= 0),
        Assists integer CHECK (Assists >= 0),
        Catches integer CHECK (Catches >= 0),
        Completions integer CHECK (Completions >= 0),
        Turnovers integer CHECK (Turnovers >= 0),
        Blocks integer CHECK (Blocks >= 0),
        PointsPlayed integer CHECK (PointsPlayed >= 0),
        UnforcedErrors integer CHECK (UnforcedErrors >= 0)
);

