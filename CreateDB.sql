USE [master]
GO
/****** Object:  Database [PostbankTask]    Script Date: 3/5/2024 4:04:31 PM ******/
CREATE DATABASE [PostbankTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PostbankTask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PostbankTask.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PostbankTask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PostbankTask_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PostbankTask] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PostbankTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PostbankTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PostbankTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PostbankTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PostbankTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PostbankTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [PostbankTask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PostbankTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PostbankTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PostbankTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PostbankTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PostbankTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PostbankTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PostbankTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PostbankTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PostbankTask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PostbankTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PostbankTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PostbankTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PostbankTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PostbankTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PostbankTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PostbankTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PostbankTask] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PostbankTask] SET  MULTI_USER 
GO
ALTER DATABASE [PostbankTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PostbankTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PostbankTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PostbankTask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PostbankTask] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PostbankTask] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PostbankTask] SET QUERY_STORE = OFF
GO
USE [PostbankTask]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 3/5/2024 4:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeLog]    Script Date: 3/5/2024 4:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeLog](
	[UserId] [int] NULL,
	[ProjectId] [int] NULL,
	[Date] [date] NOT NULL,
	[TimeLog] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_TimeLog_Date]    Script Date: 3/5/2024 4:04:31 PM ******/
CREATE CLUSTERED INDEX [IX_TimeLog_Date] ON [dbo].[TimeLog]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/5/2024 4:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Surname] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_TimeLog_ProjectId]    Script Date: 3/5/2024 4:04:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_TimeLog_ProjectId] ON [dbo].[TimeLog]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TimeLog_UserId]    Script Date: 3/5/2024 4:04:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_TimeLog_UserId] ON [dbo].[TimeLog]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TimeLog]  WITH NOCHECK ADD FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[TimeLog]  WITH NOCHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[CreateDbData]    Script Date: 3/5/2024 4:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateDbData]
AS
BEGIN
    EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';

    DELETE FROM [dbo].[TimeLog];
    DELETE FROM [dbo].[User];
    DELETE FROM [dbo].[Project];

    EXEC sp_MSforeachtable 'ALTER TABLE ? CHECK CONSTRAINT ALL';

	EXEC GenerateRandomUserData;

	INSERT INTO [dbo].[Project] (Name) VALUES
	('My own'), 
	('Free Time'), 
	('Work');

	EXEC PopulateTimeLogData;
END;
GO
/****** Object:  StoredProcedure [dbo].[GenerateRandomUserData]    Script Date: 3/5/2024 4:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GenerateRandomUserData]
AS
BEGIN
    CREATE TABLE #TempUsers
    (
        Name NVARCHAR(255),
        Surname NVARCHAR(255),
        Email NVARCHAR(255)
    );

    DECLARE @FirstName NVARCHAR(255);
    DECLARE @LastName NVARCHAR(255);
    DECLARE @Email NVARCHAR(255);

    DECLARE FirstNamesCursor CURSOR FOR
        SELECT FirstName
        FROM (
            VALUES
                ('John'), ('Gringo'), ('Mark'), ('Lisa'), ('Maria'),
                ('Sonya'), ('Philip'), ('Jose'), ('Lorenzo'), ('George'), ('Justin')
        ) AS FirstNames(FirstName);

    OPEN FirstNamesCursor;
    FETCH NEXT FROM FirstNamesCursor INTO @FirstName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE LastNamesCursor CURSOR FOR
            SELECT LastName
            FROM (
                VALUES
                    ('Johnson'), ('Lamas'), ('Jackson'), ('Brown'), ('Mason'),
                    ('Rodriguez'), ('Roberts'), ('Thomas'), ('Rose'), ('McDonalds')
            ) AS LastNames(LastName);

        OPEN LastNamesCursor;
        FETCH NEXT FROM LastNamesCursor INTO @LastName;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            DECLARE DomainNamesCursor CURSOR FOR
                SELECT DomainName
                FROM (
                    VALUES
                        ('hotmail.com'), ('gmail.com'), ('live.com')
                ) AS DomainNames(DomainName);

            OPEN DomainNamesCursor;
            FETCH NEXT FROM DomainNamesCursor INTO @Email;

            WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @Email = LOWER(CONCAT(@FirstName, '.', @LastName, '@', @Email));
                INSERT INTO #TempUsers (Name, Surname, Email)
                VALUES (@FirstName, @LastName, @Email);

                FETCH NEXT FROM DomainNamesCursor INTO @Email;
            END

            CLOSE DomainNamesCursor;
            DEALLOCATE DomainNamesCursor;

            FETCH NEXT FROM LastNamesCursor INTO @LastName;
        END

        CLOSE LastNamesCursor;
        DEALLOCATE LastNamesCursor;

        FETCH NEXT FROM FirstNamesCursor INTO @FirstName;
    END

    CLOSE FirstNamesCursor;
    DEALLOCATE FirstNamesCursor;

    INSERT INTO [dbo].[User] (Name, Surname, Email)
    SELECT TOP 100 Name, Surname, Email
    FROM #TempUsers
    ORDER BY NEWID();

    DROP TABLE #TempUsers;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetGridData]    Script Date: 3/5/2024 4:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGridData]
    @i_startDate DATE,
    @i_endDate DATE,
    @i_startIndex INT,
    @i_pageSize INT,
    @i_sortColumn NVARCHAR(255), 
    @i_sortDirection NVARCHAR(4)
AS
BEGIN
	WITH NumberedResults AS (
    SELECT u.Id,
		   u.Name,
		   u.Surname,
           SUM(l.TimeLog) TotalTime,
           ROW_NUMBER() OVER (ORDER BY
				CASE WHEN LOWER(@i_sortColumn) = 'name' AND LOWER(@i_sortDirection) = 'asc' THEN u.Name END ASC,
				CASE WHEN LOWER(@i_sortColumn) = 'name' AND LOWER(@i_sortDirection) = 'desc' THEN u.Name END DESC,
				CASE WHEN LOWER(@i_sortColumn) = 'surname' AND LOWER(@i_sortDirection) = 'asc' THEN u.Surname END ASC,
				CASE WHEN LOWER(@i_sortColumn) = 'surname' AND LOWER(@i_sortDirection) = 'desc' THEN u.Surname END DESC,
				u.Id
			) AS RowNum
    FROM TimeLog l
    INNER JOIN [User] u ON l.UserId = u.Id
    WHERE (@i_startDate IS NULL OR l.Date BETWEEN @i_startDate AND @i_endDate)
    GROUP BY u.Id, u.Name, u.Surname)

	SELECT Id,
		   Name,
		   Surname,
		   TotalTime,
		   (SELECT COUNT(*) from NumberedResults) as TotalFiltered
	FROM NumberedResults
	WHERE RowNum BETWEEN @i_startIndex + 1 AND @i_startIndex + @i_pageSize;
END;
GO
/****** Object:  StoredProcedure [dbo].[PopulateTimeLogData]    Script Date: 3/5/2024 4:04:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PopulateTimeLogData]
AS
BEGIN
    DECLARE @UserId INT;
    DECLARE @ProjectId INT;
    DECLARE @Date DATE;
    DECLARE @Hours FLOAT;

    DECLARE UsersCursor CURSOR FOR
        SELECT Id
        FROM [dbo].[User];

    OPEN UsersCursor;
    FETCH NEXT FROM UsersCursor INTO @UserId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generate a random number of rows between 1 and 20 for each user
        DECLARE @RowCount INT = ROUND(RAND() * 19, 0) + 1;

        DECLARE @Counter INT = 1;

        WHILE @Counter <= @RowCount
        BEGIN
            -- Randomly select one of the three projects
            SELECT TOP 1 @ProjectId = p.Id
		      FROM [dbo].[Project] p
		  ORDER BY NEWID();

            -- Generate random Date within the last 30 days
            SET @Date = DATEADD(DAY, -round(rand()*31, 0), GETDATE());

            -- Generate random Hours between 0.25 and 8
            SET @Hours = ROUND(RAND() * 7.75 + 0.25, 2);

            -- Check if the total hours for the user on the given date will not exceed 8
            IF NOT EXISTS (
                SELECT 1
                FROM [dbo].[TimeLog]
                WHERE UserId = @UserId AND Date = @Date
                HAVING SUM(TimeLog) + @Hours <= 8
            )
            BEGIN
                -- Insert the TimeLog entry into the TimeLog table
                INSERT INTO [dbo].[TimeLog] (UserId, ProjectId, Date, TimeLog)
                VALUES (@UserId, @ProjectId, @Date, @Hours);

                -- Increment the counter
                SET @Counter = @Counter + 1;
            END
        END

        FETCH NEXT FROM UsersCursor INTO @UserId;
    END

    CLOSE UsersCursor;
    DEALLOCATE UsersCursor;
END;
GO
USE [master]
GO
ALTER DATABASE [PostbankTask] SET  READ_WRITE 
GO
