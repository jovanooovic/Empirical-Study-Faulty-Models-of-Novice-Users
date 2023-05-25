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
pred prop6 {
// Signals are always alternating
always (Signal in Green and no Green' or no Green and Green' = Signal')
}

pred prop6C { // Signals are always alternating
	all s : Signal | always eventually (s in Green) and always eventually (s not in Green)
}
pred overconstrained { prop6C and !prop6}
pred underconstrained { !prop6C and prop6}
pred both { prop6C and prop6 }

run overconstrained
run underconstrained
run both
