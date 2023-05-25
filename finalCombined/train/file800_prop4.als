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
pred prop4 {
// There are no collisions between trains
all t = Track | lone (t.~pos)
}

pred prop4C { // There are no collisions between trains
	always all t : Track | lone pos.t
}
pred overconstrained { prop4C and !prop4}
pred underconstrained { !prop4C and prop4}
pred both { prop4C and prop4 }

run overconstrained
run underconstrained
run both
