create table spt.tblTrack(
	trackID int identity(1,1) constraint Pk_spttblTrack_trackID primary key,
	name varchar(255) not null constraint U_spttblTrack_name unique, 
	link varchar(255) not null constraint U_spttblTrack_link unique,
	popularity int,
	duration_ms int
)
alter table spt.tblTrack
	add 
	albumID int constraint Fk_spttbltrack_spttblAlbum_albumID
		foreign key references spt.tblAlbum(albumID)

/*alter table spt.tblTrack
	alter column albumID int not null
*/	