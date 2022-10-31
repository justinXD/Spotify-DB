create table spt.tblArtist(
	artistID int identity(1,1) constraint Pk_spttblArtist_artistID primary key,
	name varchar(255) not null constraint U_spttblArtist_name unique,  
	link varchar(255) not null constraint U_spttblArtist_link unique
)