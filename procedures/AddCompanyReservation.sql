create procedure AddCompanyReservation (
	@CompanyName varchar(50),
	@ConferenceName varchar(50),
	@ConferenceEditionNumber int
) as
begin transaction

	Declare @CompanyID as int
	select @CompanyID = CompanyID
	from Companies 
	where CompanyName = @CompanyName

	Declare @ConferenceEditionID as int
	select @ConferenceEditionID = ConferenceEditionID
	from Conferences
	inner join ConferenceEditions on Conferences.ConferenceID = ConferenceEditions.ConferenceID
	where NumOfEdition = @ConferenceEditionNumber and ConferenceName = @ConferenceName

	begin try
		insert into CompanyReservations (
			CompanyID,
			Date,
			Paid,
			ConferenceEditionID
		)
		values (
			@CompanyID,
			GETDATE(),
			0,
			@ConferenceEditionID
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg4 nvarchar(2048)
			= 'Cannot add CompanyyReservation. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg4, 1
	end catch
commit transaction
