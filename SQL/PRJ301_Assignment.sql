USE [PRJ301_Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Object]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Object](
	[username] [varchar](150) NOT NULL,
	[objid] [int] NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [PK_Account_Object] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[objid] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attandance]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attandance](
	[sesid] [int] NOT NULL,
	[stdid] [int] NOT NULL,
	[present] [bit] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[record_time] [datetime] NULL,
 CONSTRAINT [PK_Attandance] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC,
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[sem] [varchar](150) NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[rid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role_Account] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[sesid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[tid] [int] NOT NULL,
	[index] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[attanded] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stdid] [int] NOT NULL,
	[stdname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Group]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Group](
	[stdid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Student_Group] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 11/8/2022 11:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'anhcq', N'123', N'anhcq')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'anhkd', N'123', N'anhkd')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'anhnv', N'123', N'anhnv')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'annt', N'123', N'annt')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'duchv', N'123', N'duchv')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'duyct', N'123', N'duyct')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'hailt', N'123', N'hailt')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'hanhnd', N'123', N'hanhnd')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'minhtn', N'123', N'minhtn')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'quannh', N'123', N'quannh')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'sonnt', N'123', N'sonnt')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'thanhnvm', N'123', N'thanhnvm')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'trangnh', N'123', N'trangnh')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'tuanvm', N'123', N'tuanvm')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'tungnq', N'123', N'tungnq')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'tuvm', N'123', N'tuvm')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'vuhca', N'123', N'vuhca')
GO
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'anhcq', 3, 2)
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'anhkd', 3, 1)
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'anhnv', 4, 1)
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'duyct', 1, 2)
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'hailt', 2, 1)
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'quannh', 2, 2)
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'sonnt', 1, 1)
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'trangnh', 4, 2)
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'tuanvm', 5, 1)
INSERT [dbo].[Account_Object] ([username], [objid], [rid]) VALUES (N'vuhca', 5, 2)
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 1, 0, N'X', CAST(N'2022-11-08T21:05:04.793' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 2, 1, N'X', CAST(N'2022-11-08T21:05:04.797' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 3, 0, N'X', CAST(N'2022-11-08T21:05:04.797' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 4, 1, N'X', CAST(N'2022-11-08T21:05:04.797' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 5, 0, N'X', CAST(N'2022-11-08T21:05:04.797' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 1, 1, N'', CAST(N'2022-11-08T16:28:55.350' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 2, 1, N'', CAST(N'2022-11-08T16:28:55.447' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 3, 1, N'', CAST(N'2022-11-08T16:28:55.447' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 4, 1, N'', CAST(N'2022-11-08T16:28:55.447' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 5, 1, N'', CAST(N'2022-11-08T16:28:55.447' AS DateTime))
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'Lect Timetable', N'/lect/timetable')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'Lect Take Attandance', N'/lect/takeatt')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (3, N'Lect List Attandance', N'/lect/list')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (4, N'Student Timetable', N'/std/timetable')
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (1, N'PRO192-01', 1, 1, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (2, N'PRJ301-01', 2, 1, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (3, N'PRJ301-02', 2, 1, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (4, N'PRJ301-03', 2, 1, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (5, N'LAB211-01', 5, 2, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (6, N'LAB211-02', 5, 2, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (7, N'PRO192-02', 1, 2, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (8, N'LAB211-03', 5, 5, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (9, N'IOT102-01', 3, 3, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (10, N'IOT102-02', 3, 3, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (11, N'MAS291-01', 4, 4, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (12, N'MAE101-01', 6, 4, N'FALL', 2022)
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (1, N'Ngo Tung Son')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (2, N' Le Thanh Hai')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (3, N'Khuat Duc Anh')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (4, N'Nguyen Viet Anh')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (5, N'Vuong Minh Tuan')
GO
INSERT [dbo].[Role] ([rid], [rname]) VALUES (1, N'Lecturer')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (2, N'Student')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'anhkd')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'anhnv')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'hailt')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'sonnt')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'tuanvm')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'anhcq')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'annt')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'duchv')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'duyct')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'hanhnd')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'minhtn')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'quannh')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'thanhnvm')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'trangnh')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'tungnq')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'tuvm')
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'vuhca')
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 4)
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'DE-101')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'DE-102')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (3, N'DE-103')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (4, N'DE-104')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (5, N'DE-105')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (6, N'AL-101')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (7, N'AL-102')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (8, N'BE-101')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (9, N'BE-102')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (10, N'BE-103')
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (1, 1, 1, CAST(N'2022-11-07' AS Date), 1, 1, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (2, 1, 1, CAST(N'2022-11-09' AS Date), 1, 2, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (3, 1, 1, CAST(N'2022-11-11' AS Date), 1, 3, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (4, 1, 1, CAST(N'2022-11-14' AS Date), 1, 4, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (5, 1, 1, CAST(N'2022-11-16' AS Date), 1, 5, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (6, 2, 1, CAST(N'2022-11-07' AS Date), 2, 1, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (7, 2, 1, CAST(N'2022-11-09' AS Date), 2, 2, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (8, 2, 1, CAST(N'2022-11-11' AS Date), 2, 3, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (9, 2, 1, CAST(N'2022-11-14' AS Date), 2, 4, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (10, 2, 1, CAST(N'2022-11-16' AS Date), 2, 5, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (11, 3, 1, CAST(N'2022-11-07' AS Date), 3, 1, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (12, 3, 1, CAST(N'2022-11-09' AS Date), 3, 2, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (13, 3, 1, CAST(N'2022-11-11' AS Date), 3, 3, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (14, 3, 1, CAST(N'2022-11-14' AS Date), 3, 4, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (15, 3, 1, CAST(N'2022-11-16' AS Date), 3, 5, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (16, 4, 1, CAST(N'2022-11-07' AS Date), 4, 1, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (17, 4, 1, CAST(N'2022-11-09' AS Date), 4, 2, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (18, 4, 1, CAST(N'2022-11-11' AS Date), 4, 3, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (19, 4, 1, CAST(N'2022-11-14' AS Date), 4, 4, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (20, 4, 1, CAST(N'2022-11-16' AS Date), 4, 5, 1, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (21, 5, 2, CAST(N'2022-11-07' AS Date), 5, 1, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (22, 5, 2, CAST(N'2022-11-09' AS Date), 5, 2, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (23, 5, 2, CAST(N'2022-11-11' AS Date), 5, 3, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (24, 5, 2, CAST(N'2022-11-14' AS Date), 5, 3, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (25, 5, 2, CAST(N'2022-11-16' AS Date), 5, 4, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (26, 6, 2, CAST(N'2022-11-07' AS Date), 4, 1, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (27, 6, 2, CAST(N'2022-11-09' AS Date), 4, 2, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (28, 6, 2, CAST(N'2022-11-11' AS Date), 4, 2, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (29, 6, 2, CAST(N'2022-11-14' AS Date), 4, 2, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (30, 6, 2, CAST(N'2022-11-16' AS Date), 4, 3, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (31, 7, 3, CAST(N'2022-11-07' AS Date), 2, 1, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (32, 7, 3, CAST(N'2022-11-07' AS Date), 3, 1, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (33, 7, 3, CAST(N'2022-11-09' AS Date), 2, 2, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (34, 7, 3, CAST(N'2022-11-11' AS Date), 2, 2, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (35, 7, 3, CAST(N'2022-11-11' AS Date), 3, 2, 2, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (36, 8, 5, CAST(N'2022-11-07' AS Date), 4, 1, 5, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (37, 8, 5, CAST(N'2022-11-09' AS Date), 4, 1, 5, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (38, 8, 5, CAST(N'2022-11-11' AS Date), 4, 1, 5, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (39, 8, 5, CAST(N'2022-11-14' AS Date), 4, 1, 5, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (40, 8, 5, CAST(N'2022-11-16' AS Date), 4, 1, 5, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (41, 9, 6, CAST(N'2022-11-07' AS Date), 1, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (42, 9, 6, CAST(N'2022-11-09' AS Date), 1, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (43, 9, 6, CAST(N'2022-11-11' AS Date), 1, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (44, 9, 6, CAST(N'2022-11-14' AS Date), 1, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (45, 9, 6, CAST(N'2022-11-16' AS Date), 1, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (46, 10, 1, CAST(N'2022-11-08' AS Date), 5, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (47, 10, 1, CAST(N'2022-11-08' AS Date), 6, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (48, 10, 1, CAST(N'2022-11-10' AS Date), 5, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (49, 10, 1, CAST(N'2022-11-15' AS Date), 5, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (50, 10, 1, CAST(N'2022-11-15' AS Date), 6, 1, 3, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (51, 11, 2, CAST(N'2022-11-07' AS Date), 3, 1, 4, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (52, 11, 2, CAST(N'2022-11-09' AS Date), 3, 1, 4, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (53, 11, 2, CAST(N'2022-11-11' AS Date), 3, 1, 4, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (54, 11, 2, CAST(N'2022-11-14' AS Date), 3, 1, 4, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (55, 11, 2, CAST(N'2022-11-16' AS Date), 3, 1, 4, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (56, 12, 4, CAST(N'2022-11-08' AS Date), 1, 1, 4, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (67, 12, 4, CAST(N'2022-11-08' AS Date), 2, 1, 4, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (68, 12, 4, CAST(N'2022-11-10' AS Date), 1, 1, 4, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (69, 12, 4, CAST(N'2022-11-15' AS Date), 1, 1, 4, NULL)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (70, 12, 4, CAST(N'2022-11-15' AS Date), 2, 1, 4, NULL)
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (1, N'Chu Thanh Duy')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (2, N'Nguyen Hong Quan')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (3, N'Chu Quang Anh')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (4, N'Nguyen Ha Trang')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (5, N'Hoang Chu Anh Vu')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (6, N'Vu Nguyen Minh Thanh')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (7, N'Ta Nhat Minh')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (8, N'Hoang Van Duc')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (9, N'Nguyen Duy Hanh')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (10, N'Ngo Quang Tung')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (11, N'Nguyen Minh Duc')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (12, N'Tran Khanh Lam')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (13, N'Dang Duc Viet')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (14, N'Ly Hai Hoang')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (15, N'Nguyen Truong Minh')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (16, N'Nguyen Duy Anh')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (17, N'Tran Dai Nghia')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (18, N'Ngo Hoang Kim')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (19, N'Nguyen Duy Kien')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (20, N'Do Tran Quang Huy')
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 11)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 12)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 8)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 11)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 8)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 12)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 8)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 12)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 12)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 12)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (8, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (8, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (8, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (8, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (8, 12)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (9, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (9, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (9, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (9, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (9, 12)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (10, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (10, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (10, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (10, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (10, 12)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (11, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (11, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (11, 11)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (12, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (12, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (12, 11)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (13, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (13, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (13, 11)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (14, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (14, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (14, 11)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (15, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (15, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (15, 11)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (16, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (16, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (16, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (17, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (17, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (17, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (18, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (18, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (18, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (19, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (19, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (19, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (20, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (20, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (20, 10)
GO
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (1, N'PRO192')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (2, N'PRJ301')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (3, N'IOT102')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (4, N'MAS291')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (5, N'LAB211')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (6, N'MAE101')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (1, N'7h30 -9h')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (2, N'9h10 - 10h40')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (3, N'10h50 - 12h20')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (4, N'12h50 - 14h20')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (5, N'14h30 - 16h')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (6, N'16h10 - 17h40')
GO
ALTER TABLE [dbo].[Account_Object]  WITH CHECK ADD  CONSTRAINT [FK_Account_Object_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Account_Object] CHECK CONSTRAINT [FK_Account_Object_Account]
GO
ALTER TABLE [dbo].[Account_Object]  WITH CHECK ADD  CONSTRAINT [FK_Account_Object_Lecturer] FOREIGN KEY([objid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Account_Object] CHECK CONSTRAINT [FK_Account_Object_Lecturer]
GO
ALTER TABLE [dbo].[Account_Object]  WITH CHECK ADD  CONSTRAINT [FK_Account_Object_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Account_Object] CHECK CONSTRAINT [FK_Account_Object_Role]
GO
ALTER TABLE [dbo].[Account_Object]  WITH CHECK ADD  CONSTRAINT [FK_Account_Object_Student] FOREIGN KEY([objid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Account_Object] CHECK CONSTRAINT [FK_Account_Object_Student]
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Session] FOREIGN KEY([sesid])
REFERENCES [dbo].[Session] ([sesid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Session]
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Role]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Lecturer]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Group]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Student]
GO
