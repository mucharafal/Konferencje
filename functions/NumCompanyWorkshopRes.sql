create function NumCompanyWorkshopRes (
	@WorkshopInstanceID int
) returns int as
begin 
	declare @res as int
	select @res = sum(c.Places)
	from CompanyWorkshopInstanceReservations as c
	where @WorkshopInstanceID = c.WorkshopInstanceID

	return @res
end