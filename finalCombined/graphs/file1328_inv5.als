sig Node {
	adj : set Node
}
pred noLoops {
all n1: Node | not n1->n1 in adj
}

pred noLoopsC {
	no (iden & adj)
}
pred overconstrained { inv5C and !inv5}
pred underconstrained { !inv5C and inv5}
pred both { inv5C and inv5 }

run overconstrained
run underconstrained
run both
