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
pred prop5 {
// A train inside the station can only move to one of the next tracks (or exit the station if it is in an exit track)
 
 always (all t:Train|(one t.pos:> Exit => no t.pos) or (one t.pos => t.pos' in t.pos.prox ) 
 
 
pred prop5C { // A train inside the station can only move to one of the next tracks (or exit the station if it is in an exit track)
	all t : Train | always (some t.pos implies (t.pos' = t.pos or (t.pos in Exit implies no t.pos' else (some t.pos' and t.pos' in t.pos.prox))))
}
pred overconstrained { prop5C and !prop5}
pred underconstrained { !prop5C and prop5}
pred both { prop5C and prop5 }

run overconstrained
run underconstrained
run both
