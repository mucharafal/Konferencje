create procedure AddReservation (
	@UserID int,
	@ConferenceEditionID int
) as
declare @AddedReservationID as int
begin transaction
	begin try
		
		insert into Reservations (
			UserID,
			ConferenceEditionID
		) values (
			@UserID,
			@ConferenceEditionID
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg4 nvarchar(2048)
			= 'Cannot add Reservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg4, 1
	end catch

	select @AddedReservationID = ReservationID
	from Reservations
	where @UserID = UserID and @ConferenceEditionID = ConferenceEditionID

commit transaction
return @AddedReservationID 