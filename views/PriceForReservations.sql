create view PriceForReservation as
select r.ReservationID, sum(p.Price) as Price from Reservations as r
inner join 
( select t.ReservationID, t.Price from PriceForDaysReservations as t
	union
	select w.ReservationID, w.Price from PriceForWorkshopsReservation as w ) as p
	on r.ReservationID = p.ReservationID
	group by r.ReservationID