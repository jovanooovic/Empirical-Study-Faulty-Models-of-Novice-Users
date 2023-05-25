sig Node {
	adj : set Node
}
pred undirected {
all x,y : Node | x->y in Node and y->x in Node
}

pred undirectedC {
	adj = ~adj
}
pred overconstrained { inv1C and !inv1}
pred underconstrained { !inv1C and inv1}
pred both { inv1C and inv1 }

run overconstrained
run underconstrained
run both
