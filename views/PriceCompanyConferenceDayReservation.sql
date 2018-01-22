create view PriceCompanyConferenceDayReservation as
select ccdr.CompanyConferenceDayReservationID, tdcr.Discount * ((ccdr.Places - ccdr.Students) + ccdr.Students * (1 - ce.StudentDiscount))  as Price from CompanyConferenceDayReservations as ccdr
inner join ConferenceDays as cd on cd.ConferenceDayID = ccdr.ConferenceDayID
inner join ConferenceEditions as ce on ce.ConferenceEditionID = cd.ConferenceEditionID
inner join TimeDiscountOnCompanyReservation as tdcr on tdcr.CompanyReservationID = ccdr.CompanyReservationID