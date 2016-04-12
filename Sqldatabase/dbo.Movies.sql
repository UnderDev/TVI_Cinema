IF EXISTS(SELECT * from sys.databases WHERE name='MovieDB')
BEGIN
    DROP DATABASE MovieDB;
END

CREATE DATABASE MovieDB;
GO

USE [MovieDB];
GO

IF OBJECT_ID('dbo.Showtimes', 'U') IS NOT NULL 
  DROP TABLE dbo.Showtimes; 
GO
  
IF OBJECT_ID('dbo.Movies', 'U') IS NOT NULL 
  DROP TABLE dbo.Movies; 
GO

IF OBJECT_ID('dbo.ComingSoon', 'U') IS NOT NULL 
  DROP TABLE dbo.ComingSoon; 
GO
    
IF OBJECT_ID('dbo.Prices', 'U') IS NOT NULL 
  DROP TABLE dbo.Prices; 
GO

CREATE TABLE [dbo].[Movies] (
    [Screen]      INT           NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Poster]      VARBINARY(MAX)         NOT NULL,
    [Trailer_url] VARCHAR (20)  NOT NULL,
    [Description] VARCHAR (300) NOT NULL,
    [Director]    VARCHAR (50)  NOT NULL,
    [Length]      INT           NOT NULL,
    [Stars]       VARCHAR (100) NOT NULL,
    [Rating]      VARCHAR (10)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Screen] ASC)
);
GO
CREATE TABLE [dbo].[ComingSoon] (
    [Number]      INT           NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Poster]      VARBINARY(MAX) NOT NULL,
    [Trailer_url] VARCHAR (20)  NOT NULL,
    [Description] VARCHAR (300) NOT NULL,
    [Director]    VARCHAR (50)  NOT NULL,
    [Length]      INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Number] ASC)
);
GO  
CREATE TABLE [dbo].[Showtimes] (
    [Screen]    INT          NOT NULL,
    [Showtime]  VARCHAR (10) NOT NULL,
    [dimension] INT          NOT NULL,
    CONSTRAINT [PK_Showtimes] PRIMARY KEY CLUSTERED ([Showtime] ASC, [Screen] ASC),
    CONSTRAINT [FK_Showtimes_ToTable] FOREIGN KEY ([Screen]) REFERENCES [dbo].[Movies] ([Screen])
);
GO

CREATE TABLE [dbo].[Prices] (
    [Type]      VARCHAR (15) NOT NULL,
    [Price]     SMALLMONEY   NOT NULL,
    [dimension] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Type], [dimension])
);
GO


INSERT INTO [dbo].[Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (1, N'Deadpool',  (SELECT * FROM OPENROWSET(BULK N'C:\posters\dplol.jpg', SINGLE_BLOB) AS Poster), N'FyKWUTwSYAs', N'A former Special Forces operative turned mercenary is subjected to a rogue experiment that leaves him with accelerated healing powers, adopting the alter ego Deadpool.', N'Tim Miller', 108, 'Ryan Reynolds, Morena Baccarin', '15')
INSERT INTO [dbo].[Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (2, N'Zoolander 2', (SELECT * FROM OPENROWSET(BULK N'c:\posters\z2.jpg', SINGLE_BLOB) AS Poster), N'4CL4LNWHegk', N'Derek and Hansel are modelling again when an opposing company attempts to take them out from the business.', N'Ben Stiller', 102, 'Ben Stiller, Owen Wilson','12A')
INSERT INTO [dbo].[Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (3, N'The Revenant', (SELECT * FROM OPENROWSET(BULK N'c:\posters\tr.jpg', SINGLE_BLOB) AS Poster), N'LoebZZ8K5N0', N'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.', N'Alejandro G. Iñárritu', 156, 'Leonardo DiCaprio, Tom Hardy','15')
INSERT INTO [dbo].[Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (4, N'Daddy''s Home', (SELECT * FROM OPENROWSET(BULK N'c:\posters\dh.jpg', SINGLE_BLOB) AS Poster), N'OeknNwE4e1E', N'Stepdad, Brad Whitaker, is a radio host trying to get his stepchildren to love him and call him Dad. But his plans turn upside down when the biological father, Dusty Mayron, returns', N'Sean Anders', 96, 'Will Ferrell, Mark Wahlberg','12A')
INSERT INTO [dbo].[Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (5, N'Dirty Grandpa', (SELECT * FROM OPENROWSET(BULK N'c:\posters\dg.jpg', SINGLE_BLOB) AS Poster), N'aZSzMIFZT7Q', N'Right before his wedding, an uptight guy is tricked into driving his grandfather, a lecherous former Army Lieutenant-Colonel, to Florida for spring break.', N'Dan Mazer', 102, 'Robert De Niro, Zac Efron','15')
INSERT INTO [dbo].[Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (6, N'Goosebumps', (SELECT * FROM OPENROWSET(BULK N'c:\posters\gb.jpg', SINGLE_BLOB) AS Poster), N'7Cn716jv61s', N'A teenager teams up with the daughter of young adult horror author R. L. Stine after the writer''s imaginary demons are set free on the town of Madison, Delaware.', N'Rob Letterman', 103,'Jack Black, Dylan Minnette', 'PG')
INSERT INTO [dbo].[Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (7, N'Ride Along 2', (SELECT * FROM OPENROWSET(BULK N'c:\posters\ra2.jpg', SINGLE_BLOB) AS Poster), N'iWfmmwdCHTg', N'As his wedding day approaches, Ben heads to Miami with his soon-to-be brother-in-law James to bring down a drug dealer who''s supplying the dealers of Atlanta with product.', N'Tim Story', 102, 'Ice Cube, Kevin Hart', '12A')
INSERT INTO [dbo].[Movies] ([Screen], [Name], [Poster], [Trailer_url], [Description], [Director], [Length], [Stars], [Rating]) VALUES (8, N'Star Wars', (SELECT * FROM OPENROWSET(BULK N'c:\posters\swtfa.jpg', SINGLE_BLOB) AS Poster), N'sGbxmsDFVnE', N'Three decades after the defeat of the Galactic Empire, a new threat arises. The First Order attempts to rule the galaxy and only a ragtag group of heroes can stop them, along with the help of the Resistance.', N'J.J. Abrams', 135,'Daisy Ridley, John Boyega', '12A')

INSERT INTO [dbo].[ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (1, N'The Secret In Their Eyes',  (SELECT * FROM OPENROWSET(BULK N'C:\posters\site.jpg', SINGLE_BLOB) AS Poster), N'TftxeqCEsO4', N'A brutal murder of one of their own destroys a tight knit group of investigators fall apart', N'Billy Ray', 115)
INSERT INTO [dbo].[ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (2, N'The Forest', (SELECT * FROM OPENROWSET(BULK N'c:\posters\TheForest.jpg', SINGLE_BLOB) AS Poster), N'6hW8hUcXR-A', N'Searching for her twin sister a woman goes into Japans suicide forest', N'Jason Zada', 100)
INSERT INTO [dbo].[ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (3, N'London Has Fallen', (SELECT * FROM OPENROWSET(BULK N'c:\posters\lhf.jpg', SINGLE_BLOB) AS Poster), N'oQhX4JxGHtw', N'Mike Banning discovers a plot to assassinate the leaders of the world..', N'Babak Najafi', 100)
INSERT INTO [dbo].[ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (4, N'Kung Fu Panda 3', (SELECT * FROM OPENROWSET(BULK N'c:\posters\kfp.jpg', SINGLE_BLOB) AS Poster), N'0_xY5oJori0', N'More awesome adventures with po an his pals', N'Alessandro Carloni, Jennifer Yuh
', 120)
INSERT INTO [dbo].[ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (5, N'Hail Caeser', (SELECT * FROM OPENROWSET(BULK N'c:\posters\hc.jpg', SINGLE_BLOB) AS Poster), N'kMqeoW3XRa0', N'A 1950s Hollywood Fixers tries to keep a studios stars in line', N'Ethan Coen, Joel Coen', 110)
INSERT INTO [dbo].[ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (6, N'The Witch', (SELECT * FROM OPENROWSET(BULK N'c:\posters\tw.jpg', SINGLE_BLOB) AS Poster), N'Bcng5MX4LWQ', N'A New England Family in 1630s deal with the forces of witchcraft and black magic', N'Rob Letterman, Robert Eggers', 93)
INSERT INTO [dbo].[ComingSoon] ([Number], [Name], [Poster], [Trailer_url], [Description], [Director], [Length]) VALUES (7, N'The Divergent Series Allegiant', (SELECT * FROM OPENROWSET(BULK N'c:\posters\tdsa.jpg', SINGLE_BLOB) AS Poster), N'PUSiFAEhq1w', N'
The Bureau of Genetic Welfare take Beatrice Prior and Tobias Eaton into protective custody....', N'Robert Schwentke', 120)





INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (1, N'11:00am', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (2, N'11:00am', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (3, N'11:00am', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (4, N'11:00am', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (5, N'11:00am', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (6, N'11:00am', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (7, N'11:00am', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (8, N'11:00am', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (1, N'2:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (2, N'2:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (3, N'2:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (4, N'2:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (5, N'2:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (6, N'2:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (7, N'2:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (8, N'2:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (1, N'5:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (2, N'5:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (3, N'5:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (4, N'5:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (5, N'5:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (6, N'5:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (7, N'5:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (8, N'5:00pm', 2)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (1, N'8:00pm', 3)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (2, N'8:00pm', 3)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (3, N'8:00pm', 3)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (4, N'8:00pm', 3)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (5, N'8:00pm', 3)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (6, N'8:00pm', 3)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (7, N'8:00pm', 3)
INSERT INTO [dbo].[Showtimes] ([Screen], [Showtime], [dimension]) VALUES (8, N'8:00pm', 3)

INSERT INTO [dbo].[Prices] ([Type], [Price], [dimension]) VALUES (N'Adult', CAST(8.0000 AS SmallMoney), 2)
INSERT INTO [dbo].[Prices] ([Type], [Price], [dimension]) VALUES (N'Adult', CAST(10.0000 AS SmallMoney), 3)
INSERT INTO [dbo].[Prices] ([Type], [Price], [dimension]) VALUES (N'Child', CAST(6.0000 AS SmallMoney), 2)
INSERT INTO [dbo].[Prices] ([Type], [Price], [dimension]) VALUES (N'Child', CAST(8.0000 AS SmallMoney), 3)
INSERT INTO [dbo].[Prices] ([Type], [Price], [dimension]) VALUES (N'Senior', CAST(6.0000 AS SmallMoney), 2)
INSERT INTO [dbo].[Prices] ([Type], [Price], [dimension]) VALUES (N'Senior', CAST(8.0000 AS SmallMoney), 3)
INSERT INTO [dbo].[Prices] ([Type], [Price], [dimension]) VALUES (N'Student', CAST(7.0000 AS SmallMoney), 2)
INSERT INTO [dbo].[Prices] ([Type], [Price], [dimension]) VALUES (N'Student', CAST(8.0000 AS SmallMoney), 3)

