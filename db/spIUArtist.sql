create or ALTER proc spt.spIUArtist(
	@artistID int = 0,
	@name varchar(255),
	@link varchar(255)
)
as
	if (isnull(@artistID, 0) = 0)
	begin
	if @name is null or @link is null 
		begin
			raiserror ('El nombre y el link no pueden ser nulos', 16, 1)
			return 
		end
		begin tran
			insert into spt.tblArtist(name, link)	
				values (@name,  @link)
		if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
	end else
	begin
	if @name is null or @link is null 
		begin
			raiserror ('El nombre y el link no pueden ser nulos', 16, 1)
			return 
		end
		if exists (select top 1 1 from spt.tblArtist where name = @name and artistID <> @artistID)
		begin
			raiserror('El nombre de este artista ya existe', 16, 1)
			return
		end

		if exists (select top 1 1 from spt.tblArtist where link = @link and artistID <> @artistID)
		begin
			raiserror('El link de este artista ya existe', 16, 1)
			return
		end
		begin tran
			update spt.tblArtist 
				set 
					name = @name,
					link = @link
			where artistID = @artistID	
		if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
	end


/*
exec spIUArtist
				@artistID = 3,
				@name = 'mc razo',
				@link = 'mc razo'

select * from spt.tblArtist
select * from spt.tbltrack
select * from spt.tblalbum
drop proc spIUArtist
				*/