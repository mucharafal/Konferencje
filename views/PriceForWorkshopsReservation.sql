create view PriceForWorkshopsReservation as
select r.ReservationID, sum(w.Price) as Price from Reservations as r
inner join WorkshopReservations as wr on r.ReservationID = wr.ReservationID
inner join WorkshopInstances as ins on wr.WorkshopInstanceID = ins.WorkshopInstanceID
inner join Workshops as w on ins.WorkshopID = w.WorkshopID
group by r.ReservationID