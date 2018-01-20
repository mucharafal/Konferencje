create procedure AddCompanyWorkshopInstanceReservation
	@CompanyReservationID int,
	@WorkshopInstanceID int,
	@Participants int
as
begin transaction
		begin try

		--inserting CompanyWorkshopReservations
	
		insert into CompanyWorkshopInstanceReservations
		(
			CompanyReservationID,
			WorkshopInstanceID,
			Places
		)
		values
		(
			@CompanyReservationID,
			@WorkshopInstanceID,
			@Participants
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg4 nvarchar(2048)
			= 'Cannot add WorkshopReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg4, 1
	end catch
commit transaction