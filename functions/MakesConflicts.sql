create function MakesConflicts (@WorkshopReservationID int)
returns bit
begin 
	return 
		case 
			when (select sum(a.Conflict) 
					from AreConflicts as a 
					where a.FirstWorkshopReservation = @WorkshopReservationID 
					group by a.FirstWorkshopReservation) > 0
			then 1
			else 0
		end;
	end;