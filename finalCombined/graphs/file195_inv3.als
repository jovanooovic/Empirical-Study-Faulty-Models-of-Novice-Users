sig Node {
	adj : set Node
}
pred acyclic {
v1.adj and v2.adj implies v1 = v2
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
