create view ParticipantsInWorkshopInstance as
select p.WorkshopInstanceID,
 isnull(dbo.NumOfParticipantsInWorkshopReservations(p.WorkshopInstanceID), 0) - isnull(dbo.NumEmployeeWorkshopRes(p.WorkshopInstanceID), 0) + isnull(dbo.NumCompanyWorkshopRes(p.WorkshopInstanceID), 0) as Participants,
 p.MaxMembers - isnull(dbo.NumCompanyWorkshopRes(p.WorkshopInstanceID), 0) + isnull(dbo.NumEmployeeWorkshopRes(p.WorkshopInstanceID), 0) - isnull(dbo.NumOfParticipantsInWorkshopReservations(p.WorkshopInstanceID), 0) as AvaliablePlaces 
from WorkshopInstances as p
group by p.WorkshopInstanceID, p.MaxMembers