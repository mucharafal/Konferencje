create procedure AddCompanyConferenceDayReservation
	@CompanyReservationID int,
	@ConferenceDayID int,
	@Participants int,
	@Students int
as
begin transaction
	set nocount on
	begin try

		--inserting CompanyConferenceDayReservations
	
		insert into CompanyConferenceDayReservations
		(
			CompanyReservationID,
			Places,
			ConferenceDayID, 
			Students
		)
		values
		(
			@CompanyReservationID,
			@Participants,
			@ConferenceDayID,
			isnull(@Students, 0)
		)
	end try
	begin catch
		rollback transaction
		declare @errorMsg4 nvarchar(2048)
			= 'Cannot add CompanyConferenceDayReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg4, 1
	end catch
commit transaction