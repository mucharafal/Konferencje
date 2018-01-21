create procedure RemoveConference (
    @ConferenceID int
) as
begin transaction 
    begin try
        delete from Conferences
        where Conferences.ConferenceID = @ConferenceID 
    end try
    begin catch
        rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot remove Conference. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
    end catch 
commit transaction 