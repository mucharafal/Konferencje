create function NumEmployeeConfDayRes (
	@ConferenceDayID int
) returns int as
begin 
	declare @res as int
	select @res = count(EmplyeeConferenceDayReservationID)
	from EmployeeConferenceDayReservations as ec
	inner join CompanyConferenceDayReservations as cc 
	on ec.CompanyConferenceDayReservationID = cc.CompanyConferenceDayReservationID
	where @ConferenceDayID = cc.ConferenceDayID

	return @res
end