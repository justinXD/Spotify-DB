create or ALTER proc spt.spDeleteTrackArtist(
	@trackArtistID int = 0
)
as

	if (isnull(@trackArtistID, 0) = 0 )
	begin
			raiserror ('NO encontramos lo que buscas eliminar, intenta con otro ID', 16, 1)
			return
	end else
	begin
		begin tran
			delete from spt.tbltrackArtist
			where trackArtistID = @trackArtistID
			if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
	end
go

/*
	exec spDeleteTrackArtist
					@trackArtistID = 0
select * from spt.tbltrackArtist
select * from spt.tblArtist
select * from spt.tbltrack
drop proc spDeleteTrackArtist
*/