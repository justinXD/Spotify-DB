create or ALTER proc spt.spDeleteTrack(
	@trackID int = 0,
	@name varchar(255) = null
)
as

if (isnull(@trackID, 0) = 0 )
begin
	if (@name is null)
	begin
		raiserror ('NO encontramos el album que quieres eliminar, buscalo por nombre o por ID', 16, 1)
		return
	end
	else
		begin
			begin tran
				delete from spt.tbltrack
					where name = @name
				if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
		end
end else
begin
	begin tran
		delete from spt.tbltrack
			where trackID = @trackID
	if @@ROWCOUNT = 1
		commit tran
	else
		rollback tran
end
go

/*
	exec spDeleteTrack
					@trackID = 1,
					@name = 'el novio'
select * from spt.tblTrack
drop proc spDeleteTrack
*/