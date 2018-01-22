create view PriceCompanyConferenceDayReservations as
select ccdr.CompanyReservationID, sum(tdcr.Discount * ((ccdr.Places - ccdr.Students) + ccdr.Students * (1 - ce.StudentDiscount)))  as priceCompanyReservations from CompanyConferenceDayReservations as ccdr
inner join ConferenceDays as cd on cd.ConferenceDayID = ccdr.ConferenceDayID
inner join ConferenceEditions as ce on ce.ConferenceEditionID = cd.ConferenceEditionID
inner join TimeDiscountOnCompanyReservation as tdcr on tdcr.CompanyReservationID = ccdr.CompanyReservationID
group by ccdr.CompanyReservationID