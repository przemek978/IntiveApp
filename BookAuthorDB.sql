USE [Intive]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 03.01.2023 17:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[Gender] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 03.01.2023 17:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Rating] [decimal](18, 0) NOT NULL,
	[ISBN] [nvarchar](13) NOT NULL,
	[PublicationDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 03.01.2023 17:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [author_fk] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([Id])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [author_fk]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [book_fk] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [book_fk]
GO

INSERT INTO [dbo].[Book] ([Id], [Title], [Description], [Rating], [ISBN], [PublicationDate]) VALUES (1, N'Programming Entity Framework: DbContext', N'The DbContext API captures Entity Framework''s (EF) most commonly used features and tasks, simplifying development with EF. This concise book shows you how to use the API to perform set operations with the DbSet class, handle change tracking and resolve concurrency conflicts with the Change Tracker API, and validate changes to your data with the Validation API.With DbContext, you''ll be able to query and update data, whether you''re working with individual objects or graphs of objects and their related data. You''ll find numerous C# code samples to help you get started. All you need is experience with Visual Studio and database management basics.', CAST(10 AS Decimal(18, 0)), N'9781449312961', N'2012-01-01 00:00:00')
INSERT INTO [dbo].[Book] ([Id], [Title], [Description], [Rating], [ISBN], [PublicationDate]) VALUES (2, N'Learn C# in One Day and Learn It Well: C# for Beginners with Hands-on Project: 3', N'Have you always wanted to learn computer programming but are afraid it''ll be too difficult for you? Or perhaps you know other programming languages but are interested in learning the C# language fast?', CAST(11 AS Decimal(18, 0)), N'9781518800276', N'2015-10-27 00:00:00') 

