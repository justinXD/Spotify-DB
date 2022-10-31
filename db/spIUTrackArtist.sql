create or ALTER proc spt.spIUTrackArtist(
	@trackArtistID int = 0,
	@trackID int,
	@artistID int,
	@primaryArtist int
)
as
	if (isnull(@trackArtistID, 0) = 0)
	begin
	if @trackID is null or @artistID is null 
		begin
			raiserror ('la cancion y el artista no pueden ser nulos', 16, 1)
			return 
		end
		begin tran
			insert into spt.tbltrackArtist(trackID, artistID, primaryArtist)	
				values (@trackID,  @artistID, @primaryArtist)
		if @@ROWCOUNT = 1
			commit tran
		else
			rollback tran
	end else
	begin
	if @trackID is null or @artistID is null 
		begin
			raiserror ('la cancion y el artista no pueden ser nulos', 16, 1)
			return 
		end
		if exists (select top 1 1 from tbltrackArtist where trackArtistID = @trackArtistID)
		begin
			begin tran
				update spt.tbltrackArtist 
					set 
						trackID = @trackID,
						artistID = @artistID,
						primaryArtist = @primaryArtist
				where trackArtistID = @trackArtistID
			if @@ROWCOUNT = 1
					commit tran
				else
					rollback tran
		end
		else
		begin
			raiserror ('El ID que buscas no existe', 16, 1)
			return 
		end
	end


/*
exec spt.spIUTrackArtist
				@trackArtistID = 15,
				@trackID = 30,
				@artistID = 6,
				@primaryArtist = 3

select * from spt.tbltrackArtist
select * from spt.tblArtist
select * from spt.tbltrack
drop proc spIUTrackArtist
				*/