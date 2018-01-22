create view TimeDiscountOnCompanyReservation as
select r.CompanyReservationID, max(t.Discount) as 'Discount', t.Price from CompanyReservations as r
inner join TimeDiscountHelper as t on r.CompanyReservationID = t.ReservationID
inner join ReservationDate as d on r.CompanyReservationID = d.ReservationID
where DATEDIFF(DAY, t.Date, d.Date) > t.NumOfDaysBefore
group by r.CompanyReservationID, t.Price