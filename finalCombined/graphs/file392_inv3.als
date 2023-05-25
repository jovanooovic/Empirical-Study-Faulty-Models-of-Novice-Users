sig Node {
	adj : set Node
}
pred acyclic {
all v1, v2 : Node | v1->v2 in adj implies not (v1->v1 in adj and v2->v2 in adj)
}

pred acyclicC {
	all a:Node | a not in a.^adj
}
pred overconstrained { inv3C and !inv3}
pred underconstrained { !inv3C and inv3}
pred both { inv3C and inv3 }

run overconstrained
run underconstrained
run both
