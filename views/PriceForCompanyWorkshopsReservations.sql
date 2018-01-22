create view PriceForCompanyWorkshopsReservations as
select cwir.CompanyReservationID, sum(w.Price * cwir.Places) as Price
from CompanyWorkshopInstanceReservations as cwir 
inner join WorkshopInstances as wi on wi.WorkshopInstanceID = cwir.WorkshopInstanceID
inner join Workshops as w on w.WorkshopID = wi.WorkshopID
group by cwir.CompanyReservationID
