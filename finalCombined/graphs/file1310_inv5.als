sig Node {
	adj : set Node
}
pred noLoops {
all n1:Node | n1->n1 not in adj
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
