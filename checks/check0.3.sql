/*-----------------------------------------------------------------------------------------------
Checks:
-----------------------------------------------------------------------------------------------*/
--Users:
use rmucha_a
alter table dbo.Users 
add constraint correct_FirstName_in_Users check (Users.FirstName like '[A-Z][a-z][a-z]%');
go
alter table dbo.Users 
check constraint correct_FirstName_in_Users
go

alter table dbo.Users 
add constraint correct_LastName_in_Users check (Users.LastName like '[A-Z][a-z][a-z]%')
go
alter table dbo.Users 
check constraint correct_LastName_in_Users
go
--ContactDetails:
alter table dbo.ContactDetails
add constraint correct_PhoneNumber check (ContactDetails.PhoneNumber > 99999999)
go
alter table dbo.ContactDetails
check constraint correct_PhoneNumber
go

alter table dbo.ContactDetails
add constraint correct_Email check (ContactDetails.Email like '[a-z,A-Z,_,0-9,-][a-z,A-Z,_,0-9,-]%@[a-z,0-9,_,-][a-z,0-9,_,-]%.[a-z][a-z]%')
go
alter table dbo.ContactDetails
check constraint correct_Email
go
--Addresses:
alter table dbo.Addresses
add constraint correct_PostalCode check (Addresses.PostalCode like '[0-9][0-9]-[0-9][0-9][0-9]')
go
alter table dbo.Addresses
check constraint correct_PostalCode
go

alter table dbo.Addresses
add constraint correct_Street check (Addresses.Street like '[A-Z][a-z][a-z]% [A-Z,a-z]%')
go
alter table dbo.Addresses
check constraint correct_Street
go

alter table dbo.Addresses
add constraint correct_Number check (Addresses.Number > 0)
go
alter table dbo.Addresses
check constraint correct_Number
go
--Students:
alter table dbo.Students
add constraint correct_CardNumber check (Students.CardNumber > 0)
go
alter table dbo.Students
check constraint correct_CardNumber
go
--Cities:
alter table dbo.Cities
add constraint correct_CityName check (Cities.CityName like '[A-Z][a-z]%')
go
alter table dbo.Cities
check constraint correct_CityName
go
--Companies:
alter table dbo.Companies
add constraint correct_CompanyName check (Companies.CompanyName like '[A-Z][a-z]%')
go
alter table dbo.Companies
check constraint correct_CompanyName
go
--WorkshopInstances:
alter table dbo.WorkshopInstances
add constraint correct_WorkshopMaxMembers check (WorkshopInstances.MaxMembers > 0)
go
alter table dbo.WorkshopInstances
check constraint correct_WorkshopMaxMembers
go
--Workshops:
alter table dbo.Workshops
add constraint correct_WorkshopName check (Workshops.WorkshopName like '[A-Z][a-z]%')
go
alter table dbo.Workshops
check constraint correct_WorkshopName
go

alter table dbo.Workshops
add constraint correct_Mentor check (Workshops.Mentor like '[A-Z][a-z]% [A-Z][a-z]%')
go
alter table dbo.Workshops
check constraint correct_Mentor
go
--ConferenceEditions
alter table dbo.ConferenceEditions
add constraint correct_NumOfEdition check (ConferenceEditions.NumOfEdition > 0)
go
alter table dbo.ConferenceEditions
check constraint correct_NumOfEdition
go

alter table dbo.ConferenceEditions
add constraint correct_NumOfDay check (ConferenceEditions.NumOfDay > 0)
go
alter table dbo.ConferenceEditions
check constraint correct_NumOfDay
go

alter table dbo.ConferenceEditions
add constraint correct_ConferenceEditionsMaxMembers check (ConferenceEditions.MaxMembers > 0)
go
alter table dbo.ConferenceEditions
check constraint correct_ConferenceEditionsMaxMembers
go

alter table dbo.ConferenceEditions
add constraint correct_StudentDiscount check (ConferenceEditions.StudentDiscount >= 0 and ConferenceEditions.StudentDiscount <= 1)
go
alter table dbo.ConferenceEditions
check constraint correct_StudentDiscount
go
--Conferences
alter table dbo.Conferences
add constraint correct_ConferenceName check (Conferences.ConferenceName like '[A-Z][a-z]%' )
go
alter table dbo.Conferences
check constraint correct_ConferenceName
go

--TimeDiscounts
alter table dbo.TimeDiscounts
add constraint correct_Discount check (TimeDiscounts.Discount > 0 and TimeDiscount.Discount <= 1)
go
alter table dbo.TimeDiscounts
check constraint correct_Discount
go

alter table dbo.TimeDiscounts
add constraint correct_NumOfDaysBefore check (TimeDiscounts.NumOfDaysBefore >= 0)
go
alter table dbo.TimeDiscounts
check constraint correct_NumOfDaysBefore
go

--CompanyConferenceDayReservations
alter table dbo.CompanyConferenceDayReservations
add constraint correct_Places_CCDR check (CompanyConferenceDayReservations.Places > 0)
go
alter table dbo.CompanyConferenceDayReservations
check constraint correct_Places_CCDR
go

--CompanyWorkshopInstanceReservations
alter table dbo.CompanyWorkshopInstanceReservations
add constraint correct_CWIR check (CompanyWorkshopInstanceReservations.Places > 0)
go
alter table dbo.CompanyWorkshopInstanceReservations
check constraint correct_CWIR
go

--WorkshopReservations
alter table dbo.WorkshopReservations
add constraint workshopReservationWithDayReservation check (aleadsec(WorkshopReservationID) = 1)
go
alter table dbo.WorkshopReservations
check constraint workshopReservationWithDayReservation
go

alter table dbo.WorkshopReservations
add constraint no_conflicts check (dbo.MakesConflicts(WorkshopReservationID) = 0)
go
alter table dbo.WorkshopReservations
check constraint no_conflicts
go
