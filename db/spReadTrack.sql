create or ALTER proc spt.spReadTrack(
	@trackID int = 0,
	@name varchar(255) = null
)
as

	select * 
	from spt.tbltrack
	where (trackID = @trackID or ISNULL(@trackID, 0) = 0)
		and (name = @name or ISNULL(@name, '') = '')
go

/*
exec spReadTrack
			--@trackID = 5,
			--@name  = 'el novio'
			drop proc spReadTrack
*/
