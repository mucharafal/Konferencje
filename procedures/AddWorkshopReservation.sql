create procedure AddWorkshopReservation (
	@WorkshopInstanceID int,
	@ReservationID int
) as
declare @AddedWIID as int
begin transaction
	begin try
		insert into WorkshopReservations (
			WorkshopInstanceID,
			ReservationID
		) values (
			@WorkshopInstanceID,
			@ReservationID
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg varchar(2048) = 
			'Cannot add WorkshopReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch

	select @AddedWIID = WorkshopReservationID
	from WorkshopReservations
	where @WorkshopInstanceID = WorkshopInstanceID and @ReservationID = ReservationID

commit transaction
return @AddedWIID 