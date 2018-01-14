use Konferencje
/*
create table ConferenceTemplates (
	ConferenceTemplateID int not null,		--not null prawdopodobnie zbedne, i tak wymuszane przez primary key
	ConferenceTemplateName varchar(40) not null,
	primary key(ConferenceTemplateID)
)

create table WorkshopTemplates (
	WorkshopTemplateID int not null,
	WorkshopName varchar(255) not null,
	WorkshopDescription varchar(255),
	primary key(WorkshopTemplateID)
)

create table WorkshopTemplates_ConferenceTemplates (
	ConferenceTemplateID int not null,
	WorkshopsTemplateID int not null,
	foreign key(ConferenceTemplateID) references ConferenceTemplates,
	foreign key(WorkshopsTemplateID) references WorkshopTemplates
)
*/
create table Companies (
	CompanyID int not null,
	CompanyName varchar(255) not null,
	ContactName varchar(255),
	ContactNumber numeric(9) not null,
	Adress varchar(255) not null,
	City varchar(255) not null,
	PostalCode numeric(5) not null,
	primary key(CompanyID)
)

create table Users (
	UserID int not null unique,
	Name varchar(255) not null,
	Phone numeric(9) not null,
	Email varchar(255) not null,
	Adress varchar(255),
	City varchar(255),
	PostalCode numeric(5),
	StudentIDNumber varchar(255),
	IsWildCard bit,
	primary key(UserID),
)

create table Conferences (
	ConferenceID int not null unique,
	ConferenceTemplateID int not null,
	ConferenceDate date not null,
	Duration int not null,
	primary key(ConferenceID),
	--foreign key(ConferenceTemplateID) references ConferenceTemplates
)

create table Participats (
	ParticipantID int,
	UserID int, 
	CompanyID int,
	primary key(ParticipantID),
	foreign key(UserID) references 

create table ConferenceDays (
	ConferenceDayID int not null unique,
	ConferenceID int not null,
	DayDate date not null,
	Price int not null,
	MaxMembers int not null,
	StartTime time(7) not null,
	EndTime time(7) not null,
	primary key(ConferenceDayID),
	foreign key(ConferenceID) references Conferences
)

create table Workshops (
	WorkshopID int not null unique,
	WorkshopTemplateID int not null,
	ConferenceDayID int not null,
	MaxMembers int not null,
	Price int not null,
	StartTime time(7) not null,
	EndTime time(7) not null,
	primary key(WorkshopID),
	foreign key(WorkshopTemplateID) references WorkshopTemplates,
	foreign key(ConferenceDayID) references ConferenceDays
)

create table WorkshopReservations (
	WorkshopReservationID int not null unique,
	WorkshopID int not null,
	UserID int not null,
	Discount float(10),
	Paid bit,
	Cancelled bit,
	primary key(WorkshopReservationID),
	foreign key(WorkshopID) references Workshops,
	foreign key(UserID) references Users,
)

create table ConferenceDayReservation (
	ConferenceDayReservationID int not null unique,
	ConferenceDayID int not null,
	UserID int not null,
	DateOfReservation date not null,
	Discount float,
	Paid bit,
	Cancelled bit,
	primary key(ConferenceDayReservationID),
	foreign key(ConferenceDayID) references ConferenceDays,
	foreign key(UserID) references Users
)

