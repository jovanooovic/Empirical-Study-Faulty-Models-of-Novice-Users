sig Node {
	adj : set Node
}
pred noLoops {
all n1,n2:Node | some n1.adj:>n2 implies n1 != n2
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
