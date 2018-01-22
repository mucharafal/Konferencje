create view CompanyReservationsView as
select cr.CompanyReservationID, c.ConferenceName, ce.NumOfEdition, cd.ConferenceDayDate, ccdr.Places, ccdr.Students, price from CompanyReservations as cr
inner join CompanyConferenceDayReservations as ccdr on ccdr.CompanyReservationID = cr.CompanyReservationID
inner join ConferenceDays as cd on cd.ConferenceDayID = ccdr.ConferenceDayID
inner join ConferenceEditions as ce on ce.ConferenceEditionID = cd.ConferenceEditionID
inner join Conferences as c on ce.ConferenceID = c.ConferenceID
union
select * from CompanyReservations as cr
inner join CompanyWorkshopInstanceReservations as cwir on cwir.CompanyReservationID = cr.CompanyReservationID
inner join WorkshopInstances as wi on wi.WorkshopInstanceID = cwir.WorkshopInstanceID
inner join ConferenceDays as cd on cd.ConferenceDayID = wi.ConferenceDayID
inner join ConferenceEditions as ce on ce.ConferenceEditionID = cd.ConferenceEditionID
inner join Conferences as c on ce.ConferenceID = c.ConferenceID
--brakuje price for company reservation