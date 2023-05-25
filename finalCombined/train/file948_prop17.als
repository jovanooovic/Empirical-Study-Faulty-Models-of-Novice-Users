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
pred prop17 {
// The first train to be inside the station will be the first to arrive at an exit track
always (some t:Train | historically no Train.pos and eventually(t.pos in Exit and historically no Exit))
}

pred prop17C {
	all t : Train | always ((some t.pos and historically no (Train-t).pos) implies (no Train.pos & Exit until some t.pos & Exit))
}
pred overconstrained { prop17C and !prop17 }
pred underconstrained { !prop17C and prop17 }
pred both { prop17C and prop17 }

run overconstrained
run underconstrained
run both
