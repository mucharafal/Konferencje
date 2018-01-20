create procedure AddCompanyReservation (
	@CompanyID int,
	@ConferenceEditionID int
) as
declare @AddedCompanyReservationID as int
begin transaction

	declare @date as date
	set @date = getdate()

	begin try
		insert into CompanyReservations (
			CompanyID,
			Date,
			Paid,
			ConferenceEditionID
		)
		values (
			@CompanyID,
			@date,
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

	select @AddedCompanyReservationID = CompanyReservationID
	from CompanyReservations
	where @CompanyID = CompanyID and @ConferenceEditionID = ConferenceEditionID and @date = date

commit transaction
return @AddedCompanyReservationID