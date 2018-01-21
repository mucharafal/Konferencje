create view RemovableDayReservations as 
select cdr.ConferenceDayReservationID, cdr.ConferenceDayID, r.UserID
from ConferenceDayReservations 
inner join Reservations as r 
on cdr.ReservationID = r.ReservationID
inner join PrivateReservations as pr 
on r.ReservationID = pr.ReservationID
inner join ConferenceDays as cd 
on cdr.ConferenceDayID = cd.ConferenceDayID 
where cd.ConferenceDayDate > getdate()
and pr.Paid = 0