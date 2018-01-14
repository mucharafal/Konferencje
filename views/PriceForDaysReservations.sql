create view PriceForDaysReservations as
select r.ReservationID, s.Discount * sum(t.Price * t.Discount) as Price from Reservations as r
inner join StudentDiscountOnReservation as s on r.ReservationID = s.ReservationID
inner join TimeDiscountOnReservation as t on r.ReservationID = t.ReservationID
group by r.ReservationID, s.Discount
