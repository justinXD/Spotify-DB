create or ALTER proc spt.spDeleteArtist(
	@artistID int = 0
)
as

	if (isnull(@artistID, 0) = 0 )
	begin
			raiserror ('NO encontramos el artista a eliminar, intenta con otro ID', 16, 1)
			return
	end else
	begin
		begin tran
			delete from spt.tblArtist
			where artistID = @artistID
			if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
	end
go

/*
	exec spDeleteArtist
					@artistID = 14
select * from spt.tblArtist
drop proc spDeleteArtist
*/