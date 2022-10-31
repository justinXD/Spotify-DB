create table spt.tbltrackArtist(
	trackArtistID int identity(1,1) constraint Pk_spttbltrackArtist_trackArtistID primary key, 
	trackID int not null constraint Fk_spttbltrackArtist_spttbltrack_trackID
		foreign key references spt.tbltrack(trackID),
	artistID int not null constraint Fk_spttbltrackArtist_spttblartist_artistID
		foreign key references spt.tblArtist(artistID),
	primaryArtist int not null
)
--drop table spt.tbltrackArtist