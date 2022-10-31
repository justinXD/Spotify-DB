create or ALTER proc spt.spIUalbum(
	@albumID int = 0,
	@name varchar(255),
	@link varchar(255),
	@image_300 varchar(255) = null,
	@release_date date = null
)
as
	if (isnull(@albumID, 0) = 0)
	begin
		if @name is null or @link is null
		begin
			raiserror ('Nombre y link deben ser diferentes a nullo', 16, 1)
			return 
		end

		begin tran
			insert into spt.tblalbum (name, link, image_300, release_date)	--es buena practica definir los parametros que va a recibir la tabla
			values (@name,  @link, @image_300, @release_date)
			
			if @@ROWCOUNT = 1
				commit tran
		else
			rollback tran
	end else
	begin
		if @name is null or @link is null
		begin
			raiserror ('Nombre y link deben ser diferentes a nullo', 16, 1)
			return 
		end

		if exists (select top 1 1 from spt.tblAlbum where name = @name and albumID <> @albumID)
		begin
			raiserror('El nombre del albun ya existe', 16, 1)
			return
		end

		if exists (select top 1 1 from spt.tblAlbum where link = @link and albumID <> @albumID)
		begin
			raiserror('El link del albun ya existe', 16, 1)
			return
		end

		begin tran
			update spt.tblalbum 
				set 
					name = @name,
					link = @link,
					image_300 = @image_300,
					release_date = @release_date
			where albumID = @albumID	--EL WHERE ES SUPER IMPORTANTE PARA FILTRAR DATOS
		if @@ROWCOUNT = 1
			commit tran
		else
			rollback tran
	end


/*exec spIUalbum
				--@albumID = 1,
				@name = 'after hours',
				@link = 'the weeekend',
				@image_300 = '.png',
				@release_date = '20210902'
select * from spt.tblalbum
drop proc spIUalbum
				*/