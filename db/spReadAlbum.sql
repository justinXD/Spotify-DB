create or ALTER proc spt.spReadAlbum(
	@albumID int = 0,
	@name varchar(255) = null
)
as

	select * 
	from spt.tblalbum
	where (albumID = @albumID or ISNULL(@albumID, 0) = 0)
		and (name = @name or ISNULL(@name, '') = '')
--if (isnull(@albumID, 0) = 0 )
--begin
--		if (@name is null)
--		begin
--			select * from spt.tblalbum
--			return
--		end
--		else
--			select top 1 * from spt.tblalbum
--				where name = @name
--end else
--begin
--	select top 1 * from spt.tblalbum
--	where albumID = @albumID	--EL WHERE ES SUPER IMPORTANTE PARA FILTRAR DATOS
--end


/*exec spReadAlbums 
				--@albumID = 3,
				@name = 'jazz vinil'
select * from spt.tblalbum
drop proc spt.spReadAlbums
				*/