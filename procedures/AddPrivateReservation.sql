create procedure AddPrivateReservation (
	@UserID int,
	@ConferenceEditionID int
) as
declare @AddedPRID as int
begin transaction
	begin try
		declare @ReservationID as int
		exec @ReservationID = AddReservation @UserID, @ConferenceEditionID
	
		declare @date as date
		set @date = getdate()
		
		insert into PrivateReservations (
			ReservationID,
			Date,
			Paid
		) values (
			@ReservationID,
			@date,
			0
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg4 nvarchar(2048)
			= 'Cannot add PrivateReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg4, 1
	end catch

	select @AddedPRID = PrivateReservationID
	from PrivateReservations
	where @ReservationID = ReservationID and @date = Date

commit transaction
return @AddedPRID 