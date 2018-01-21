create procedure RemoveConferenceEdition (
    @ConferenceEditionID int
) as
begin transaction 
    begin try
        delete from ConferenceEditions
        where ConferenceEditionID = @ConferenceEditionID
        and ConferenceEditions.Date > getdate()
    end try
    begin catch
        rollback transaction;
		declare @errorMsg nvarchar(2048)
			= 'Cannot remove ConferenceEdition. Error message: ' + ERROR_MESSAGE();
		;Throw 52000, @errorMsg, 1
	end catch
commit transaction;