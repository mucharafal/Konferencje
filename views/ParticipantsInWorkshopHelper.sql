create view ParticipantsInWorkshopsHelper as
select p.WorkshopInstanceID, count(p.WorkshopReservationID) as Participants
from WorkshopReservations as p
inner join Reservations as q on p.ReservationID = q.ReservationID
inner join EmployeeWorkshopInstanceReservations as r on r.ReservationID = q.ReservationID
inner join CompanyWorkshopInstanceReservations as s on s.CompanyWorkshopInstanceReservationID = r.CompanyWorkshopInstanceReservationID
group by p.WorkshopInstanceID