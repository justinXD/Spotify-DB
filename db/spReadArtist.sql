create or ALTER proc spt.spReadArtist(
	@artistID int = 0,
	@name varchar(255) = null
)
as

	select * 
	from spt.tblArtist
	where (artistID = @artistID or ISNULL(@artistID, 0) = 0)
		and (name = @name or ISNULL(@name, '') = '')
go

/*
exec spReadArtist
			@artistID = 1,
			--@name  = 'inspector'

select * from spt.tblArtist
drop proc spReadArtist
*/