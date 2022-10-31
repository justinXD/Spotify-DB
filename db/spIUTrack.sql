create or ALTER proc spt.spIUTrack(
	@trackID int = 0,
	@name varchar(255),
	@link varchar(255),
	@duration_ms int = null,
	@albumID int
)
as
	if (isnull(@trackID, 0) = 0)
	begin
	if @name is null or @link is null or @albumID is null
		begin
			raiserror ('Nombre, link y albumID deben ser diferentes a nullo', 16, 1)
			return 
		end
		begin tran
			insert into spt.tbltrack (name, link, duration_ms, albumID)	--es buena practica definir los parametros que va a recibir la tabla
				values (@name,  @link, @duration_ms, @albumID)
			if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
	end else
	begin
	if @name is null or @link is null or @albumID is null
		begin
			raiserror ('Nombre, link y albumID deben ser diferentes a nullo', 16, 1)
			return 
		end
		if exists (select top 1 1 from spt.tblTrack where name = @name and trackID <> @trackID)
		begin
			raiserror('El nombre de esta canción ya existe', 16, 1)
			return
		end

		if exists (select top 1 1 from spt.tblTrack where link = @link and trackID <> @trackID)
		begin
			raiserror('El link de esta canción ya existe', 16, 1)
			return
		end
		begin tran
			update spt.tbltrack 
				set 
					name = @name,
					link = @link,
					duration_ms = @duration_ms,
					albumID = @albumID
			where trackID = @trackID	--EL WHERE ES SUPER IMPORTANTE PARA FILTRAR DATOS
		if @@ROWCOUNT = 1
				commit tran
			else
				rollback tran
	end


/*exec spIUTrack
				--@trackID = 5,
				@name = 'us and them',
				@link = 'pink floydd',
				@duration_ms = 420000,
				@albumID =2
select * from spt.tbltrack
select * from spt.tblalbum
drop proc spIUTrack
				*/