create procedure AddEmployeeWorkshopInstanceReservation (
	@ReservationID int,
	@CompanyWorkshopInstanceReservationID int
) as
declare @AddedValID as int
begin transaction
	begin try 
		
		declare @WorkshopInstanceID as int
		select @WorkshopInstanceID = WorkshopInstanceID
		from CompanyWorkshopInstanceReservations
		where @CompanyWorkshopInstanceReservationID = CompanyWorkshopInstanceReservationID

		exec AddWorkshopReservation @WorkshopInstanceID, @ReservationID
	
		insert into EmployeeWorkshopInstanceReservations(
			CompanyWorkshopInstanceReservationID,
			ReservationID
		) values (
			@CompanyWorkshopInstanceReservationID,
			@ReservationID
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg varchar(2048) = 
			'Cannot add EmployeeWorkshopInstanceReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch

	select @AddedValID = EmployeeWorkshopInstanceReservationID
	from EmployeeWorkshopInstanceReservations
	where @CompanyWorkshopInstanceReservationID = CompanyWorkshopInstanceReservationID and @ReservationID = ReservationID

commit transaction
return @AddedValID