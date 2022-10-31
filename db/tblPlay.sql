create table spt.tblPlay(
	playID int identity(1,1) constraint Pk_spttblTrack_playID primary key,
	playedAt datetime not null,  
	trackID int not null constraint Fk_spttblPlay_spttbltrack_trackID
		foreign key references spt.tbltrack(trackID)
)