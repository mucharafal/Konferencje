create view ParticipantsInWorkshopInstance as
select p.WorkshopInstanceID, s.Participants - redundant.Participants + count(p.WorkshopReservationID) as Participants, q.MaxMembers - count(p.WorkshopReservationID) + redundant.Participants - s.Participants as AvaliablePlaces from WorkshopReservations as p
inner join WorkshopInstances as q on p.WorkshopInstanceID = q.WorkshopInstanceID
inner join ParticipantsInWorkshopsHelper as redundant on p.WorkshopInstanceID = redundant.WorkshopInstanceID
inner join ParticipantsInWorkshopInstanceFromCompany as s on p.WorkshopInstanceID = s.WorkshopInstanceID
group by p.WorkshopInstanceID, q.MaxMembers, redundant.Participants, s.Participants

