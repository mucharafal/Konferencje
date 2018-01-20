create procedure AddEmployeeConferenceDayReservation (
	@ReservationID int,
	@CompanyConferenceDayReservationID int
) as
declare @AddedValID as int
begin transaction
	begin try 
		
		declare @ConferenceDayID as int
		select @ConferenceDayID = ConferenceDayID 
		from CompanyConferenceDayReservations 
		where @CompanyConferenceDayReservationID = CompanyConferenceDayReservationID

		exec AddConferenceDayReservation @ConferenceDayID, @ReservationID
	
		insert into EmployeeConferenceDayReservations (
			CompanyConferenceDayReservationID,
			ReservationID
		) values (
			@CompanyConferenceDayReservationID,
			@ReservationID
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg varchar(2048) = 
			'Cannot add EmployeeConferenceDayReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch

	select @AddedValID = EmplyeeConferenceDayReservationID
	from EmployeeConferenceDayReservations
	where @CompanyConferenceDayReservationID = CompanyConferenceDayReservationID and @ReservationID = ReservationID

commit transaction
return @AddedValID