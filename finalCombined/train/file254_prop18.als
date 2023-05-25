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
pred prop18 {
When several trains are trying to enter a junction the first that arrived will have priority

}

pred prop18C {
	all j : Junction | always (all disj x,y : pos.(prox.j) | before (x in pos.(prox.j) and y not in pos.(prox.j)) implies (x in pos.j releases (y not in pos.j)))
}
pred overconstrained { prop18C and !prop18}
pred underconstrained { !prop18C and prop18}
pred both {prop18C and prop18}

run overconstrained
run underconstrained
run both
