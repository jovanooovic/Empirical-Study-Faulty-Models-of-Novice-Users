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
pred prop8 {
// A train at a track with a red signal can only move after the signal becomes green
always (all t:Train |(t.pos.signal) in (Signal-Green) implies (some t.pos') and ((t.pos.signal) in Green))

}
pred prop8C { // A train at a track with a red signal can only move after the signal becomes green
	all t : Train, p : Track | always (t.pos = p and p.signal not in Green implies (p.signal in Green releases t.pos = p))
}
pred overconstrained { prop8C and !prop8}
pred underconstrained { !prop8C and prop8}
pred both { prop8C and prop8 }

run overconstrained
run underconstrained
run both
