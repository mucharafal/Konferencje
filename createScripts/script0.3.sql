/****** Object:  Table [dbo].[Addresses]    Script Date: 12.01.2018 17:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[PostalCode] [char](6) NOT NULL,
	[Street] [varchar](50) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 12.01.2018 17:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] NOT NULL,
	[CityName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [CityNameUnique] UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 12.01.2018 17:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[ContactID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Companies_ContactIDUnique] UNIQUE NONCLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [CompanyNameUnique] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyConferenceDayReservations]    Script Date: 12.01.2018 17:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyConferenceDayReservations](
	[CompanyConferenceDayReservationID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Places] [int] NOT NULL,
	[ConferenceDayID] [int] NOT NULL,
 CONSTRAINT [PK_CompanyConferenceDayReservations] PRIMARY KEY CLUSTERED 
(
	[CompanyConferenceDayReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyWorkshopInstanceReservations]    Script Date: 12.01.2018 17:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyWorkshopInstanceReservations](
	[CompanyWorkshopInstanceReservationID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[WorkshopInstanceID] [int] NOT NULL,
	[Places] [int] NOT NULL,
 CONSTRAINT [PK_CompanyWorkshopInstanceReservations] PRIMARY KEY CLUSTERED 
(
	[CompanyWorkshopInstanceReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceDayReservations]    Script Date: 12.01.2018 17:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceDayReservations](
	[ConferenceDayReservationID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceDayID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
 CONSTRAINT [PK_ConferenceDayReservations] PRIMARY KEY CLUSTERED 
(
	[ConferenceDayReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceDays]    Script Date: 12.01.2018 17:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceDays](
	[ConferenceDayID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceEditionID] [int] NOT NULL,
	[ConferenceDayDate] [date] NOT NULL,
 CONSTRAINT [PK_ConferenceDays] PRIMARY KEY CLUSTERED 
(
	[ConferenceDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConferenceEditions]    Script Date: 12.01.2018 17:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceEditions](
	[ConferenceEditionID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[NumOfEdition] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[NumOfDay] [int] NOT NULL,
	[MaxMembers] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[StudentDiscount] [float] NOT NULL,
 CONSTRAINT [PK_ConferenceEditions] PRIMARY KEY CLUSTERED 
(
	[ConferenceEditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conferences]    Script Date: 12.01.2018 17:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conferences](
	[ConferenceID] [int] IDENTITY(1,1) NOT NULL,
	[ConferenceName] [varchar](50) NOT NULL,
	[ConferenceDescription] [varchar](1000) NULL,
 CONSTRAINT [PK_Conferences] PRIMARY KEY CLUSTERED 
(
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Conferences] UNIQUE NONCLUSTERED 
(
	[ConferenceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactDetails]    Script Date: 12.01.2018 17:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactDetails](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PhoneNumber] [numeric](9, 0) NOT NULL,
 CONSTRAINT [PK_ContactDetails] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [EmailUnique] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [PhoneUnique] UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeConferenceDayReservations]    Script Date: 12.01.2018 17:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeConferenceDayReservations](
	[EmplyeeConferenceDayReservationID] [int] NOT NULL,
	[CompanyConferenceDayReservationID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeConferenceDayReservations] PRIMARY KEY CLUSTERED 
(
	[EmplyeeConferenceDayReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeWorkshopInstanceReservations]    Script Date: 12.01.2018 17:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeWorkshopInstanceReservations](
	[EmployeeWorkshopInstanceReservationID] [int] NOT NULL,
	[CompanyWorkshopInstanceReservationID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeWorkshopInstanceReservations] PRIMARY KEY CLUSTERED 
(
	[EmployeeWorkshopInstanceReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 12.01.2018 17:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ReservationDate] [date] NOT NULL,
	[isPaid] [bit] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12.01.2018 17:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[UserID] [int] NOT NULL,
	[CardNumber] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Students] UNIQUE NONCLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeDiscount]    Script Date: 12.01.2018 17:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeDiscount](
	[TimeDicountID] [int] IDENTITY(1,1) NOT NULL,
	[NumOfDaysBefore] [int] NOT NULL,
	[Discount] [float] NOT NULL,
	[ConferenceEditionID] [int] NOT NULL,
 CONSTRAINT [PK_TimeDiscount] PRIMARY KEY CLUSTERED 
(
	[TimeDicountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.01.2018 17:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ContactID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Users_ContactIDUnique] UNIQUE NONCLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkshopInstances]    Script Date: 12.01.2018 17:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkshopInstances](
	[WorkshopInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[WorkshopID] [int] NOT NULL,
	[ConferenceDayID] [int] NOT NULL,
	[Time] [time](7) NOT NULL,
	[MaxMembers] [int] NOT NULL,
 CONSTRAINT [PK_WorkshopInstances] PRIMARY KEY CLUSTERED 
(
	[WorkshopInstanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkshopReservations]    Script Date: 12.01.2018 17:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkshopReservations](
	[WorkshopReservationID] [int] IDENTITY(1,1) NOT NULL,
	[WorkshopInstaceID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
 CONSTRAINT [PK_WorkshopReservations] PRIMARY KEY CLUSTERED 
(
	[WorkshopReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshops]    Script Date: 12.01.2018 17:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshops](
	[WorkshopID] [int] IDENTITY(1,1) NOT NULL,
	[WorkshopName] [varchar](50) NOT NULL,
	[WorkshopDescription] [varchar](5000) NOT NULL,
	[Mentor] [varchar](50) NOT NULL,
	[Duration] [time](7) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Workshops] PRIMARY KEY CLUSTERED 
(
	[WorkshopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Workshops] UNIQUE NONCLUSTERED 
(
	[WorkshopName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConferenceEditions] ADD  CONSTRAINT [DF_ConferenceEditions_NumOfDay]  DEFAULT ((1)) FOR [NumOfDay]
GO
ALTER TABLE [dbo].[ConferenceEditions] ADD  CONSTRAINT [DF_ConferenceEditions_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[ConferenceEditions] ADD  CONSTRAINT [DF_ConferenceEditions_StudentDiscount]  DEFAULT ((0)) FOR [StudentDiscount]
GO
ALTER TABLE [dbo].[TimeDiscount] ADD  CONSTRAINT [DF_TimeDiscount_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Workshops] ADD  CONSTRAINT [DF_Workshops_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Cities]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Addresses] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Addresses]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_ContactDetails] FOREIGN KEY([ContactID])
REFERENCES [dbo].[ContactDetails] ([ContactID])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_ContactDetails]
GO
ALTER TABLE [dbo].[CompanyConferenceDayReservations]  WITH CHECK ADD  CONSTRAINT [FK_CompanyConferenceDayReservations_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[CompanyConferenceDayReservations] CHECK CONSTRAINT [FK_CompanyConferenceDayReservations_Companies]
GO
ALTER TABLE [dbo].[CompanyConferenceDayReservations]  WITH CHECK ADD  CONSTRAINT [FK_CompanyConferenceDayReservations_ConferenceDays] FOREIGN KEY([ConferenceDayID])
REFERENCES [dbo].[ConferenceDays] ([ConferenceDayID])
GO
ALTER TABLE [dbo].[CompanyConferenceDayReservations] CHECK CONSTRAINT [FK_CompanyConferenceDayReservations_ConferenceDays]
GO
ALTER TABLE [dbo].[CompanyWorkshopInstanceReservations]  WITH CHECK ADD  CONSTRAINT [FK_CompanyWorkshopInstanceReservations_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([ContactID])
GO
ALTER TABLE [dbo].[CompanyWorkshopInstanceReservations] CHECK CONSTRAINT [FK_CompanyWorkshopInstanceReservations_Companies]
GO
ALTER TABLE [dbo].[CompanyWorkshopInstanceReservations]  WITH CHECK ADD  CONSTRAINT [FK_CompanyWorkshopInstanceReservations_WorkshopInstances] FOREIGN KEY([WorkshopInstanceID])
REFERENCES [dbo].[WorkshopInstances] ([WorkshopInstanceID])
GO
ALTER TABLE [dbo].[CompanyWorkshopInstanceReservations] CHECK CONSTRAINT [FK_CompanyWorkshopInstanceReservations_WorkshopInstances]
GO
ALTER TABLE [dbo].[ConferenceDayReservations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceDayReservations_ConferenceDays] FOREIGN KEY([ConferenceDayID])
REFERENCES [dbo].[ConferenceDays] ([ConferenceDayID])
GO
ALTER TABLE [dbo].[ConferenceDayReservations] CHECK CONSTRAINT [FK_ConferenceDayReservations_ConferenceDays]
GO
ALTER TABLE [dbo].[ConferenceDayReservations]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceDayReservations_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[ConferenceDayReservations] CHECK CONSTRAINT [FK_ConferenceDayReservations_Reservations]
GO
ALTER TABLE [dbo].[ConferenceDays]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceDays_ConferenceEditions] FOREIGN KEY([ConferenceEditionID])
REFERENCES [dbo].[ConferenceEditions] ([ConferenceEditionID])
GO
ALTER TABLE [dbo].[ConferenceDays] CHECK CONSTRAINT [FK_ConferenceDays_ConferenceEditions]
GO
ALTER TABLE [dbo].[ConferenceEditions]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceEditions_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ConferenceID])
GO
ALTER TABLE [dbo].[ConferenceEditions] CHECK CONSTRAINT [FK_ConferenceEditions_Conferences]
GO
ALTER TABLE [dbo].[EmployeeConferenceDayReservations]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeConferenceDayReservations_CompanyConferenceDayReservations] FOREIGN KEY([CompanyConferenceDayReservationID])
REFERENCES [dbo].[CompanyConferenceDayReservations] ([CompanyConferenceDayReservationID])
GO
ALTER TABLE [dbo].[EmployeeConferenceDayReservations] CHECK CONSTRAINT [FK_EmployeeConferenceDayReservations_CompanyConferenceDayReservations]
GO
ALTER TABLE [dbo].[EmployeeConferenceDayReservations]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeConferenceDayReservations_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[EmployeeConferenceDayReservations] CHECK CONSTRAINT [FK_EmployeeConferenceDayReservations_Reservations]
GO
ALTER TABLE [dbo].[EmployeeWorkshopInstanceReservations]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeWorkshopInstanceReservations_CompanyWorkshopInstanceReservations] FOREIGN KEY([CompanyWorkshopInstanceReservationID])
REFERENCES [dbo].[CompanyWorkshopInstanceReservations] ([CompanyWorkshopInstanceReservationID])
GO
ALTER TABLE [dbo].[EmployeeWorkshopInstanceReservations] CHECK CONSTRAINT [FK_EmployeeWorkshopInstanceReservations_CompanyWorkshopInstanceReservations]
GO
ALTER TABLE [dbo].[EmployeeWorkshopInstanceReservations]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeWorkshopInstanceReservations_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[EmployeeWorkshopInstanceReservations] CHECK CONSTRAINT [FK_EmployeeWorkshopInstanceReservations_Reservations]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Users]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
ALTER TABLE [dbo].[TimeDiscount]  WITH CHECK ADD  CONSTRAINT [FK_TimeDiscount_ConferenceEditions] FOREIGN KEY([ConferenceEditionID])
REFERENCES [dbo].[ConferenceEditions] ([ConferenceEditionID])
GO
ALTER TABLE [dbo].[TimeDiscount] CHECK CONSTRAINT [FK_TimeDiscount_ConferenceEditions]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Addresses] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Addresses]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_ContactDetails] FOREIGN KEY([ContactID])
REFERENCES [dbo].[ContactDetails] ([ContactID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_ContactDetails]
GO
ALTER TABLE [dbo].[WorkshopInstances]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopInstances_ConferenceDays] FOREIGN KEY([ConferenceDayID])
REFERENCES [dbo].[ConferenceDays] ([ConferenceDayID])
GO
ALTER TABLE [dbo].[WorkshopInstances] CHECK CONSTRAINT [FK_WorkshopInstances_ConferenceDays]
GO
ALTER TABLE [dbo].[WorkshopInstances]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopInstances_Workshops] FOREIGN KEY([WorkshopID])
REFERENCES [dbo].[Workshops] ([WorkshopID])
GO
ALTER TABLE [dbo].[WorkshopInstances] CHECK CONSTRAINT [FK_WorkshopInstances_Workshops]
GO
ALTER TABLE [dbo].[WorkshopReservations]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopReservations_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[WorkshopReservations] CHECK CONSTRAINT [FK_WorkshopReservations_Reservations]
GO
ALTER TABLE [dbo].[WorkshopReservations]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopReservations_WorkshopInstances] FOREIGN KEY([WorkshopInstaceID])
REFERENCES [dbo].[WorkshopInstances] ([WorkshopInstanceID])
GO
ALTER TABLE [dbo].[WorkshopReservations] CHECK CONSTRAINT [FK_WorkshopReservations_WorkshopInstances]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [correct_Number] CHECK  (([Addresses].[Number]>(0)))
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [correct_Number]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [correct_PostalCode] CHECK  (([Addresses].[PostalCode] like '[0-9][0-9]-[0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [correct_PostalCode]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [correct_Street] CHECK  (([Addresses].[Street] like '[A-Z][a-z][a-z]% [A-Z,a-z]%'))
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [correct_Street]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [correct_CityName] CHECK  (([Cities].[CityName] like '[A-Z][a-z]%'))
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [correct_CityName]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [correct_CompanyName] CHECK  (([Companies].[CompanyName] like '[A-Z][a-z]%'))
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [correct_CompanyName]
GO
ALTER TABLE [dbo].[ConferenceEditions]  WITH CHECK ADD  CONSTRAINT [correct_ConferenceEditionsMaxMembers] CHECK  (([ConferenceEditions].[MaxMembers]>(0)))
GO
ALTER TABLE [dbo].[ConferenceEditions] CHECK CONSTRAINT [correct_ConferenceEditionsMaxMembers]
GO
ALTER TABLE [dbo].[ConferenceEditions]  WITH CHECK ADD  CONSTRAINT [correct_NumOfDay] CHECK  (([ConferenceEditions].[NumOfDay]>(0)))
GO
ALTER TABLE [dbo].[ConferenceEditions] CHECK CONSTRAINT [correct_NumOfDay]
GO
ALTER TABLE [dbo].[ConferenceEditions]  WITH CHECK ADD  CONSTRAINT [correct_NumOfEdition] CHECK  (([ConferenceEditions].[NumOfEdition]>(0)))
GO
ALTER TABLE [dbo].[ConferenceEditions] CHECK CONSTRAINT [correct_NumOfEdition]
GO
ALTER TABLE [dbo].[ConferenceEditions]  WITH CHECK ADD  CONSTRAINT [correct_StudentDiscount] CHECK  (([ConferenceEditions].[StudentDiscount]>=(0) AND [ConferenceEditions].[StudentDiscount]<=(1)))
GO
ALTER TABLE [dbo].[ConferenceEditions] CHECK CONSTRAINT [correct_StudentDiscount]
GO
ALTER TABLE [dbo].[Conferences]  WITH CHECK ADD  CONSTRAINT [correct_ConferenceName] CHECK  (([Conferences].[ConferenceName] like '[A-Z][a-z]%'))
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [correct_ConferenceName]
GO
ALTER TABLE [dbo].[ContactDetails]  WITH CHECK ADD  CONSTRAINT [correct_Email] CHECK  (([ContactDetails].[Email] like '[a-z,A-Z,_,0-9,-][a-z,A-Z,_,0-9,-]%@[a-z,0-9,_,-][a-z,0-9,_,-]%.[a-z][a-z]%'))
GO
ALTER TABLE [dbo].[ContactDetails] CHECK CONSTRAINT [correct_Email]
GO
ALTER TABLE [dbo].[ContactDetails]  WITH CHECK ADD  CONSTRAINT [correct_PhoneNumber] CHECK  (([ContactDetails].[PhoneNumber]>(99999999)))
GO
ALTER TABLE [dbo].[ContactDetails] CHECK CONSTRAINT [correct_PhoneNumber]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [correct_CardNumber] CHECK  (([Students].[CardNumber]>(0)))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [correct_CardNumber]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [correct_FirstName_in_Users] CHECK  (([Users].[FirstName] like '[A-Z][a-z][a-z]%'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [correct_FirstName_in_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [correct_LastName_in_Users] CHECK  (([Users].[LastName] like '[A-Z][a-z][a-z]%'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [correct_LastName_in_Users]
GO
ALTER TABLE [dbo].[WorkshopInstances]  WITH CHECK ADD  CONSTRAINT [correct_WorkshopMaxMembers] CHECK  (([WorkshopInstances].[MaxMembers]>(0)))
GO
ALTER TABLE [dbo].[WorkshopInstances] CHECK CONSTRAINT [correct_WorkshopMaxMembers]
GO
ALTER TABLE [dbo].[Workshops]  WITH CHECK ADD  CONSTRAINT [correct_Mentor] CHECK  (([Workshops].[Mentor] like '[A-Z][a-z]% [A-Z][a-z]%'))
GO
ALTER TABLE [dbo].[Workshops] CHECK CONSTRAINT [correct_Mentor]
GO
ALTER TABLE [dbo].[Workshops]  WITH CHECK ADD  CONSTRAINT [correct_WorkshopName] CHECK  (([Workshops].[WorkshopName] like '[A-Z][a-z]%'))
GO
ALTER TABLE [dbo].[Workshops] CHECK CONSTRAINT [correct_WorkshopName]
GO
USE [master]
GO
ALTER DATABASE [rmucha_a] SET  READ_WRITE 
GO
