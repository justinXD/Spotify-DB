create or ALTER proc spt.spReadTrackArtist(
	@trackArtistID int = 0,
	@primaryArtist int = 0
)
as

	select * 
	from spt.tblTrackArtist
	where (trackArtistID = @trackArtistID or ISNULL(@trackArtistID, 0) = 0)
		and (primaryArtist = @primaryArtist or ISNULL(@primaryArtist, '') = '')
go

/*
exec spt.spReadTrackArtist
			--@trackArtistID = 1,
			--@primaryArtist  = 7

select * from spt.tblTrackArtist
drop proc spReadTrackArtist
*/