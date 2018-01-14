--Wymaga zerowej zni¿ki
create view TimeDiscountOnReservation as
select r.ReservationID, max(t.Discount) as 'Discount', t.Price from Reservations as r
inner join TimeDiscountHelper as t on r.ReservationID = t.ReservationID
inner join ReservationDate as d on r.ReservationID = d.ReservationID
where DATEDIFF(DAY, t.Date, d.Date) > t.NumOfDaysBefore
group by r.ReservationID, t.Price
