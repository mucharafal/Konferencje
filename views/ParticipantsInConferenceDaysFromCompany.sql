create view ParticipantsInConferenceDaysFromCompany as
select ConferenceDayID, sum(c.Places) as Participants from CompanyConferenceDayReservations as c
group by c.ConferenceDayID