sig Node {
	adj : set Node
}
pred acyclic {
all n1:Node | some n1.adj:>Node implies (n1 not in n1.^adj:>Node)
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
