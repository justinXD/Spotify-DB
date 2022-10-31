create or ALTER proc spt.spDeletePlay(
	@playID int = 0
)
as

	if (isnull(@playID, 0) = 0 )
	begin
			raiserror ('NO encontramos la cancion a eliminar, intenta con otro ID', 16, 1)
			return
	end else
	begin
		begin tran
			delete from spt.tblPlay
				where playID = @playID
			if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
	end
go

/*
	exec spDeletePlay
					@playID = 13
select * from spt.tblPlay
drop proc spDeletePlay
*/