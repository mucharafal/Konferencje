create procedure dbo.AddConferenceEdition
	@ConferenceName varchar(50),
	@Date date,
	@NumOfDays int,
	@MaxMembers int,
	@Price money,
	@StudentDiscount float
as
begin transaction
	set nocount on
	Declare @ConferenceID as int
	select @ConferenceID = ConferenceID
	from Conferences 
	where ConferenceName = @ConferenceName

	declare @NumOfEdition as int
	select @NumOfEdition = count(ConferenceEditionID)
	from ConferenceEditions
	where ConferenceID = @ConferenceID

	set @NumOfEdition = @NumOfEdition + 1

	begin try
		insert into ConferenceEditions
		(
			ConferenceID,
			NumOfEdition,
			Date,
			NumOfDay,
			MaxMembers,
			Price,
			StudentDiscount
		)
		values
		(
			@ConferenceID,
			@NumOfEdition,
			@Date,
			@NumOfDays,
			@MaxMembers,
			@Price,
			isnull(@StudentDiscount, 0)
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot add ConferenceEdition. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
commit transaction;