sig Node {
	adj : set Node
}
pred transitive {
all a1,a2,a3:adj | some a1.a2
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
