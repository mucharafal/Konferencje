create view ParticipantsInWorkshopInstanceFromCompany as
select WorkshopInstanceID, sum(c.Places) as Participants from CompanyWorkshopInstanceReservations as c
group by c.WorkshopInstanceID