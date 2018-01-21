create function GetWorkshopInstanceIDFromCompanyWorkshopReservationID (
	@CompanyWorkshopReservationID int
) returns int as
begin 
	declare @res as int
	select @res = WorkshopInstanceID
	from CompanyWorkshopInstanceReservations
	where @CompanyWorkshopReservationID = CompanyWorkshopInstanceReservationID

	return @res
end