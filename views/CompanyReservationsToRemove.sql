create view CompanyReservationsToRemove as 
select cr.CompanyReservationID, c.ConferenceName from CompanyReservations as cr
inner join ConferenceEditions as ce on ce.ConferenceEditionID = cr.ConferenceEditionID
inner join Conferences as c on ce.ConferenceID = c.ConferenceID
inner join PriceForCompanyReservation as prices on prices.CompanyReservationID = cr.CompanyReservationID
where cr.Paid = 0 
and DATEADD(day, 7, cr.Date) > getdate()