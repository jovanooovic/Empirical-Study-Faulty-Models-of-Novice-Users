sig Node {
	adj : set Node
}
pred transitive {
all e1 | e1.*adj in e1.adj 
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
