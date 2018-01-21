create function NumCompanyConferenceDayRes (
	@ConferenceDayID int
) returns int as
begin 
	declare @res as int
	select @res = sum(c.Places)
	from CompanyConferenceDayReservations as c
	where @ConferenceDayID = c.ConferenceDayID

	return @res
end