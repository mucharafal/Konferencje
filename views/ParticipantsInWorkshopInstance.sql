create view ParticipantsInWorkshopInstance as
select p.WorkshopInstanceID, r.Participants + count(p.WorkshopReservationID) as Participants, q.MaxMembers - count(p.WorkshopReservationID) - r.Participants as AvaliablePlaces from WorkshopReservations as p
inner join WorkshopInstances as q on p.WorkshopInstanceID = q.WorkshopInstanceID
inner join ParticipantsInWorkshopsHelper as r on p.WorkshopInstanceID = r.WorkshopInstanceID
group by p.WorkshopInstanceID, q.MaxMembers, r.Participants
