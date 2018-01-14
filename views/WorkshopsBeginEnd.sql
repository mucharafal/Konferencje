create view WorkshopsBeginEnd as
select WorkshopReservations.WorkshopReservationID, WorkshopInstances.Time as 'begin', DATEADD(MINUTE, (datepart(minute, Workshops.Duration) + 60 * DATEPART(hour, Workshops.Duration)),WorkshopInstances.Time) as 'end'
from WorkshopReservations
inner join WorkshopInstances on WorkshopReservations.WorkshopInstaceID = WorkshopInstances.WorkshopInstanceID
inner join Workshops on WorkshopInstances.WorkshopID = Workshops.WorkshopID