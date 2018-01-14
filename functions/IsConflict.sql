create function IsConflict
(
	@WorkshopInstanceID1 int,
	@WorkshopInstanceID2 int
)
returns int
as
begin
	return	case
		when ((select 'begin' from WorkshopsBeginEnd as a where a.WorkshopReservationID = @WorkshopInstanceID1) < (select 'begin' from WorkshopsBeginEnd as a where a.WorkshopReservationID = @WorkshopInstanceID2) and 
			(select 'begin' from WorkshopsBeginEnd as a where a.WorkshopReservationID = @WorkshopInstanceID2) < (select 'end' from WorkshopsBeginEnd as a where a.WorkshopReservationID = @WorkshopInstanceID1)) or
			 ((select 'begin' from WorkshopsBeginEnd as a where a.WorkshopReservationID = @WorkshopInstanceID2) < (select 'begin' from WorkshopsBeginEnd as a where a.WorkshopReservationID = @WorkshopInstanceID1) and 
			(select 'begin' from WorkshopsBeginEnd as a where a.WorkshopReservationID = @WorkshopInstanceID1) < (select 'end' from WorkshopsBeginEnd as a where a.WorkshopReservationID = @WorkshopInstanceID2))
			then 1
			else 0
	end
end;
