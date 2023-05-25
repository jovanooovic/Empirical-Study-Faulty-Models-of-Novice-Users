sig Track {
	prox : set Track,
	signal : lone Signal
}
sig Junction extends Track {}
sig Entry, Exit in Track {}

sig Signal {}
var sig Green in Signal {}

sig Train {
	var pos : lone Track
}

fact Layout {
	// A track is a junction iff it has more than one successor or more than one predecessor
	all t : Track | t not in Junction iff (lone t.prox and lone prox.t)
	// No cycles
	no t : Track | t in t.^prox
	// Signals belong to one and only one track
	all s : Signal | one signal.s
	// All tracks before junctions have signals
	all j : Junction, t : prox.j | some t.signal
	// Entry tracks are those without predecessors and exit tracks are those without no successors
	all t : Track | t in Entry iff no prox.t
	all t : Track | t in Exit iff no t.prox
}
pred prop16 {
// A train in an exit track was always inside the station since it arrived at an entry track
always all t : Train | (t.pos = Exit) implies ((always some t.pos) since (t.pos = Entry))
}

pred prop16C {
	all t : Train | always (some t.pos & Exit implies (some t.pos since some t.pos & Entry))
}
pred overconstrained { prop16C and !prop16}
pred underconstrained { !prop16C and prop16}
pred both { prop16C and prop16 }

run overconstrained
run underconstrained
run both
