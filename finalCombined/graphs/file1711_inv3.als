sig Node {
	adj : set Node
}
pred acyclic {
all x, y : Node | x->y in adj implies y->x not in adj and no x.(^adj) & x 
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
