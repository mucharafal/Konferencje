create view ParticipantsInWorkshopInstance as
select p.WorkshopInstanceID, count(p.WorkshopReservationID) as Participants, q.MaxMembers - count(p.WorkshopReservationID) as AvaliablePlaces from WorkshopReservations as p
inner join WorkshopInstances as q on p.WorkshopInstanceID = q.WorkshopInstanceID
group by p.WorkshopInstanceID, q.MaxMembers
