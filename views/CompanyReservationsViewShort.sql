create view CompanyReservationsViewShort as
select cr.CompanyReservationID, c.ConferenceName, ce.NumOfEdition, ce.Date as ConfDate, cr.Date as ReservationDate, prices.Price, cr.Paid from CompanyReservations as cr
inner join ConferenceEditions as ce on ce.ConferenceEditionID = cr.ConferenceEditionID
inner join Conferences as c on ce.ConferenceID = c.ConferenceID
inner join PriceForCompanyReservation as prices on prices.CompanyReservationID = cr.CompanyReservationID