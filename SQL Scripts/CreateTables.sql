USE SingerSongwriter;

CREATE TABLE dimTime (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `Hour` INT NOT NULL,
    `Minute` INT NOT NULL,
    `Second` INT NOT NULL
);

CREATE TABLE dimDate (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `Month` INT NOT NULL,
    `Day` INT NOT NULL,
    `Year` INT NOT NULL,
    WeekNumberOfYear INT NOT NULL,
    `Date` DATE NOT NULL
);

CREATE TABLE dimLocation (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	City VARCHAR(255),
    `StateOrProvince` VARCHAR(255),
    Country VARCHAR(255)
);

CREATE TABLE dimSongLabel (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    LocationKey INT,
    FOREIGN KEY (LocationKey) REFERENCES dimLocation(ID), 
	`Name` VARCHAR(255) NOT NULL
);

CREATE TABLE dimArtist (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    BirthdayKey INT,
    FOREIGN KEY (BirthdayKey) REFERENCES dimDate(ID),
    `Name` VARCHAR(255) NOT NULL,
    Gender VARCHAR(15),
    Nationality VARCHAR(255),
    Zodiac VARCHAR(25)
);

CREATE TABLE ArtistBridge (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ArtistKey INT,
    FOREIGN KEY (ArtistKey) REFERENCES dimArtist(ID)
);

CREATE TABLE dimSong (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ReleaseDateKey INT,
    FOREIGN KEY (ReleaseDateKey) REFERENCES dimDate(ID),
    ArtistBridgeKey INT,
    FOREIGN KEY (ArtistBridgeKey) REFERENCES ArtistBridge(ID),
    DurationKey INT,
    FOREIGN KEY (DurationKey) REFERENCES dimTime(ID),
    SongLabelKey INT,
    FOREIGN KEY (SongLabelKey) REFERENCES dimSongLabel(ID),
    Title VARCHAR(255) NOT NULL,
    Tempo INT,
    Loudness INT,
    IsExplicit INT,
    Camelot VARCHAR(5),
    NumberOfUniqueWords INT,
    SentimentScore INT,
    LyricsURL VARCHAR(255)
);

CREATE TABLE factSongWeeklyRank (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    SongKey INT,
    FOREIGN KEY (SongKey) REFERENCES dimSong(ID),
    DateKey INT,
    FOREIGN KEY (DateKey) REFERENCES dimDate(ID),
	`Rank` INT NOT NULL
);

CREATE TABLE dimAward (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `Name` VARCHAR(255) NOT NULL
);

CREATE TABLE factArtistAward (
	ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ArtistKey INT,
    FOREIGN KEY (ArtistKey) REFERENCES dimArtist(ID),
    AwardDateKey INT,
    FOREIGN KEY (AwardDateKey) REFERENCES dimDate(ID),
    AwardKey INT,
	FOREIGN KEY (AwardKey) REFERENCES dimAward(ID)
);


