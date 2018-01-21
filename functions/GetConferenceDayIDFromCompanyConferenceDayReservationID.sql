create function GetConferenceDayIDFromCompanyConferenceDayReservationID (
	@CompanyConferenceDayReservationID int
) returns int as
begin 
	declare @res as int
	select @res = ConferenceDayID
	from CompanyConferenceDayReservations
	where @CompanyConferenceDayReservationID = CompanyConferenceDayReservationID

	return @res
end