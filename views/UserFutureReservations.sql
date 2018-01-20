create view UserFutureReservations as
select r.ReservationID, r.ConferenceEditionID, c.ConferenceName
from Reservations as r 
inner join ConferenceEditions as ce 
on r.ConferenceEditionID = ce.ConferenceEditionID
inner join Conferences as c 
on ce.ConferenceID = c.ConferenceID
inner join PrivateReservations as pr 
on r.ReservationID = pr.ReservationID
where ce.Date > getdate() and pr.Paid = 0