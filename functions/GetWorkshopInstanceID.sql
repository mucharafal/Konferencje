create function GetWorkshopInstanceID (
	@ConferenceDayID int,
	@StartTime time
) returns int
as 
begin 
	Declare @WorkshopInstanceID as int
	select @WorkshopInstanceID = WorkshopInstanceID
	from WorkshopInstances
	where ConferenceDayID = @ConferenceDayID and WorkshopInstances.Time = @StartTime

	if(@WorkshopInstanceID is null) 
	begin
		declare @errorMsg1 nvarchar(2048)
			= 'No such workshops'
		;return cast(@errorMsg1 as int)
	end

	return @WorkshopInstanceID
	end;