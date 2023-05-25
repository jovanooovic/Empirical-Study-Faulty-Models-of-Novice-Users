sig Node {
	adj : set Node
}
pred acyclic {
all x, y, z : Node | x->y in adj and z->y in adj implies y = z
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
