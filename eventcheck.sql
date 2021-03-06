USE [eventCheck]
GO
/****** Object:  Table [dbo].[theEvent]    Script Date: 12/07/2017 18:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theEvent](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[reocType] [nvarchar](20) NULL,
	[timeStarts] [time](7) NOT NULL,
	[timeEnds] [time](7) NOT NULL,
	[timestamp] [timestamp] NOT NULL,
	[active] [bit] NOT NULL,
	[dateStarts] [date] NOT NULL,
	[dateEnds] [date] NOT NULL,
	[questionId] [nvarchar](50) NULL,
	[groupId] [nvarchar](50) NULL,
 CONSTRAINT [PK_event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 12/07/2017 18:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id] [nvarchar](50) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[answeroption] [nvarchar](100) NOT NULL,
	[active] [bit] NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[individualGroup]    Script Date: 12/07/2017 18:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[individualGroup](
	[individualId] [nvarchar](50) NOT NULL,
	[groupId] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_individualGroup] PRIMARY KEY CLUSTERED 
(
	[individualId] ASC,
	[groupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Individual]    Script Date: 12/07/2017 18:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Individual](
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[fname] [nvarchar](50) NULL,
	[lname] [nvarchar](50) NULL,
	[kid] [bit] NULL,
	[active] [bit] NULL,
	[familyId] [nvarchar](50) NULL,
	[timestamp] [timestamp] NOT NULL,
	[password] [nvarchar](50) NULL,
	[avatar] [nvarchar](100) NULL,
	[id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Individual] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group]    Script Date: 12/07/2017 18:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[active] [bit] NULL,
	[timestamp] [timestamp] NOT NULL,
	[description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attendance]    Script Date: 12/07/2017 18:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendance](
	[memberId] [nvarchar](50) NOT NULL,
	[eventId] [nvarchar](50) NOT NULL,
	[study] [nvarchar](50) NOT NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_attendance] PRIMARY KEY CLUSTERED 
(
	[memberId] ASC,
	[eventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 12/07/2017 18:07:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer](
	[questionId] [nvarchar](50) NOT NULL,
	[eventId] [nvarchar](50) NOT NULL,
	[individualId] [nvarchar](50) NOT NULL,
	[answer] [nvarchar](100) NULL,
	[timestamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_answer] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC,
	[eventId] ASC,
	[individualId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
