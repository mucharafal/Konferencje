create procedure dbo.AddConference (
	@ConferenceName varchar(50),
	@ConferenceDescription varchar(1000),
	@Date date,
	@NumOfDays int,
	@MaxMembers int,
	@Price money,
	@StudentDiscount float
)
as
begin transaction
	set nocount on
	begin try
		insert into Conferences
		(
			ConferenceName,
			ConferenceDescription
		)
		values
		(
			@ConferenceName,
			@ConferenceDescription
		)

		exec AddConferenceEdition @ConferenceName, @Date, @NumOfDays, @MaxMembers, @Price, @StudentDiscount;
	end try
	begin catch
		rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot add Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
commit transaction