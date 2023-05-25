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
pred prop13 {
// Trains that left the station never return
 always all t : Train | no t.pos implies always no t.pos'
}

pred prop13C {
	all t : Train | always ((no t.pos and once some t.pos) implies always no t.pos)
}
pred overconstrained { prop13C and !prop13}
pred underconstrained { !prop13C and prop13}
pred both { prop13C and prop13 }

run overconstrained
run underconstrained
run both
