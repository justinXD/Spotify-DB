create or ALTER proc spt.spReadPlay(
	@trackID int = 0,
	@playID int = 0
)
as

	select * 
	from spt.tblPlay
	where (trackID = @trackID or ISNULL(@trackID, 0) = 0)
		and (playID = @playID or ISNULL(@playID, '') = '')
go

/*
exec spReadPlay
			--@trackID = 11,
			@playID  = 5

select * from spt.tblPlay
drop proc spReadPlay
*/