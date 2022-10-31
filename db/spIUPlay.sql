create or ALTER proc spt.spIUPlay(
	@playID int = 0,
	@playedAt datetime,
	@trackID int
)
as
	if (isnull(@playID, 0) = 0)
	begin
	if @playedAt is null or @trackID is null 
		begin
			raiserror ('La fecha y el trackID no pueden ser nulos', 16, 1)
			return 
		end
		begin tran
			insert into spt.tblPlay (playedAt, trackID)	
				values (@playedAt,  @trackID)
		if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
	end else
	begin
	if @playedAt is null or @trackID is null
		begin
			raiserror ('La fecha y el trackID no pueden ser nulos', 16, 1)
			return 
		end
		if exists (select top 1 1 from spt.tblPlay where playedAt = @playedAt and playID <> @playID)
		begin
			raiserror('Esta fecha con este playID ya existe', 16, 1)
			return
		end

		if exists (select top 1 1 from spt.tblPlay where trackID = @trackID and playID <> @playID)
		begin
			raiserror('Este track con este playID ya existe', 16, 1)
			return
		end
		begin tran
			update spt.tblPlay 
				set 
					playedAt = @playedAt,
					trackID = @trackID
			where playID = @playID
		if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
	end


/*
exec spIUPlay
				--@playID = 1,
				@playedAt = '20220804 16:55',
				@trackID = 10

select * from spt.tblPlay
select * from spt.tbltrack
select * from spt.tblalbum
drop proc spIUPlay
				*/