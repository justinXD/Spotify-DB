--create schema spt

create table spt.tblAlbum(
	albumID int identity(1,1) constraint Pk_spttblAlbum_IDAlbum primary key,
	name varchar(255) not null constraint U_spttblAlbum_name unique, 
	link varchar(255) not null constraint U_spttblAlbum_link unique,
	image_300 varchar(255),
	release_date date
)
