create procedure dbo.AddConference
	@ConferenceName varchar(50),
	@ConferenceDescription varchar(1000)
as
begin
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
	end try
	begin catch
		declare @errorMsg nvarchar(2048)
			= 'Cannot add Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
end
go