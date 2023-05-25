sig Node {
	adj : set Node
}
pred transitive {
all n1,n2,n3:Node | some (n1.adj:>n2) and some (n2.adj:>n3) implies some n1.adj:>n3
}

pred transitiveC {
	adj.adj in adj
}
pred overconstrained { inv8C and !inv8}
pred underconstrained { !inv8C and inv8}
pred both { inv8C and inv8 }

run overconstrained
run underconstrained
run both
