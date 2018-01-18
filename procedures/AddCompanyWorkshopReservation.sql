create procedure AddCompanyWorkshopInstanceReservation
	@CompanyReservationID int,
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int,
	@ConferenceDayNumber int,
	@WorkshopName varchar(50),
	@WorkshopStartTime time,
	@Participants int
as
begin transaction
	--finding ConferenceDayID and WorkshopInstanceID
	begin try
		Declare @ConferenceDayID as int
		Set @ConferenceDayID = dbo.GetConferenceDayID(@ConferenceName, @ConferenceEditionNumber, @ConferenceDayNumber)

		Declare @WorkshopInstanceID as int
		Set @WorkshopInstanceID = dbo.GetWorkshopInstanceID(@ConferenceDayID, @WorkshopStartTime)
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