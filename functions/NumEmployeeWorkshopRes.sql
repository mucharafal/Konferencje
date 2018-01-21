create function NumEmployeeWorkshopRes (
	@WorkshopInstanceID int
) returns int as
begin 
	declare @res as int
	select @res = count(EmployeeWorkshopInstanceReservationID)
	from EmployeeWorkshopInstanceReservations as ec
	inner join CompanyWorkshopInstanceReservations as cc 
	on ec.CompanyWorkshopInstanceReservationID = cc.CompanyWorkshopInstanceReservationID
	where @WorkshopInstanceID = cc.WorkshopInstanceID

	return @res
end