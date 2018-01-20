create procedure AddConferenceDayReservation (
	@ConferenceDayID int,
	@ReservationID int
) as
declare @AddedCDRID as int
begin transaction
	begin try
		insert into ConferenceDayReservations(
			ConferenceDayID,
			ReservationID
		) values (
			@ConferenceDayID,
			@ReservationID
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg varchar(2048) = 
			'Cannot add ConferenceDayReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch

	select @AddedCDRID = ConferenceDayReservationID
	from ConferenceDayReservations
	where @ConferenceDayID = ConferenceDayID and @ReservationID = ReservationID

commit transaction
return @AddedCDRID 