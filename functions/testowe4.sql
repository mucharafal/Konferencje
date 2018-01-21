use rmucha_a
exec AddAddress 'Poznan', '22-222', 'Ka rol', 11

alter table dbo.Addresses
drop constraint correct_Street
select * from ConferenceDayReservations
select * from ConferenceDays as cd 
inner join ConferenceEditions as ce on cd.ConferenceEditionID = ce.ConferenceEditionID

exec AddConference 'nowka', 'aa', '20180202', 3, 1, 2000, 0.2
exec AddReservation 9, 11
exec AddConferenceDayReservation 30, 5

print dbo.NumberOfFreePlacesConferenceDay(30)

select * from ParticipantsInConferenceDayHelper2

print dbo.NumOfParticipantsInConfDayConferenceDayReservations(30)

select * from Reservations
exec AddCompanyReservation 