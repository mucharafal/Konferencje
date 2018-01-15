create view ParticipantsInConferenceDayHelper as
select p.ConferenceDayID, count(p.ConferenceDayReservationID) as Participants
from ConferenceDayReservations as p
inner join Reservations as q on p.ReservationID = q.ReservationID
inner join EmployeeConferenceDayReservations as r on r.ReservationID = q.ReservationID
inner join CompanyConferenceDayReservations as s on s.CompanyConferenceDayReservationID = r.CompanyConferenceDayReservationID
group by p.ConferenceDayID