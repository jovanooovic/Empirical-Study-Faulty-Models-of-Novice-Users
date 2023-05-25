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
pred prop14 {
// Immediately after a train leaves a track with a green signal the signal turns red
always ( all t:Train | (some t.pos and one (t.pos.signal :>Green) )implies after (t.pos.signal in Signal-Green) )

}
pred prop14C {
	all s : Signal, t : Train | always (s in Green and t.pos = signal.s and t.pos' != signal.s implies after s not in Green)
}
pred overconstrained { prop14C and !prop14}
pred underconstrained { !prop14C and prop14}
pred both { prop14C and prop14 }

run overconstrained
run underconstrained
run both
