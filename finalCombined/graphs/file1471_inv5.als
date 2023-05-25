sig Node {
	adj : set Node
}
pred noLoops {


/*
The graph is weakly connected, ie, it is possible to reach every node from every node ignoring edge direction.
pred noLoopsC {
	no (iden & adj)
}
pred overconstrained { inv5C and !inv5}
pred underconstrained { !inv5C and inv5}
pred both { inv5C and inv5 }

run overconstrained
run underconstrained
run both
