create view PriceForCompanyReservation as
select p.CompanyReservationID, sum(p.Price) as Price from
 (select * from PriceForCompanyWorkshopsReservations
	union
	select * from PriceCompanyConferenceDayReservations) as p
	group by p.CompanyReservationID