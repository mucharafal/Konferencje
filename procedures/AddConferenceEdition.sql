create procedure dbo.AddConferenceEdition
	@ConferenceName varchar(50),
	@Date date,
	@NumOfDays int,
	@MaxMembers int,
	@Price money,
	@StudentDiscount float
as
begin transaction
	if (select ConferenceID from Conferences where @ConferenceName = ConferenceName) is null
	begin
		rollback transaction;
		declare @errorMsg1 nvarchar(2048)
			= 'Invalid ConferenceName';
		;Throw 52000, @errorMsg1, 1
	end

	Declare @ConferenceID as int
	select @ConferenceID = ConferenceID
	from Conferences 
	where ConferenceName = @ConferenceName

	set nocount on
	if(@StudentDiscount is not null)
	begin try
		insert into ConferenceEditions
		(
			ConferenceID,
			Date,
			NumOfDay,
			MaxMembers,
			Price,
			StudentDiscount
		)
		values
		(
			@ConferenceID,
			@Date,
			@NumOfDays,
			@MaxMembers,
			@Price,
			@StudentDiscount
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot add Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
	else 
	begin try
		insert into ConferenceEditions
		(
			ConferenceID,
			Date,
			NumOfDay,
			MaxMembers,
			Price,
			StudentDiscount
		)
		values
		(
			@ConferenceID,
			@Date,
			@NumOfDays,
			@MaxMembers,
			@Price,
			0
		)
	end try
	begin catch
		rollback transaction;
		declare @errorMsg2 nvarchar(2048)
			= 'Cannot add Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg2, 1
	end catch
commit transaction;