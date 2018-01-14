create view AreConflicts as
select a.WorkshopReservationID as 'FirstWorkshopReservation', b.WorkshopReservationID as 'SecondWorkshopReservation', dbo.IsConflict(a.WorkshopReservationID, b.WorkshopReservationID) as 'Conflict'
from WorkshopReservations as a 
inner join WorkshopReservations as b on (a.ReservationID = b.ReservationID and a.WorkshopReservationID != b.WorkshopReservationID)
