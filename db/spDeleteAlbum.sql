create or ALTER proc spt.spDeleteAlbum(
	@albumID int = 0,
	@name varchar(255) = null
)
as
if (isnull(@albumID, 0) = 0 )
begin
	if (@name is null)
	begin
		raiserror ('NO encontramos el album que quieres eliminar, buscalo por nombre o por ID', 16, 1)
		return
	end
	else
		begin tran
			delete from spt.tblalbum
				where name = @name
			if @@ROWCOUNT = 1
			commit tran
		else
			rollback tran
end else
begin
	begin tran
		delete from spt.tblalbum
			where albumID = @albumID
		if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
end

/*
	exec spDeleteAlbum
					--@albumID = 1,
					@name = 'el rey del camino'
select * from spt.tblalbum
*/
