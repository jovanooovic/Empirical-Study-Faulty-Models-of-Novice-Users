sig Node {
	adj : set Node
}
pred transitive {
all n,o,p:Node | n->o in adj and o->p in adj implies n->p in adj
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
