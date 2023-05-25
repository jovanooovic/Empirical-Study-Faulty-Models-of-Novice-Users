sig Node {
	adj : set Node
}
pred weaklyConnected {
all x, y : Node | x->y in adj or y->x in adj
}

pred weaklyConnectedC {
	all n:Node | Node in n.*(adj+~adj)
}
pred overconstrained { inv6C and !inv6}
pred underconstrained { !inv6C and inv6}
pred both { inv6C and inv6 }

run overconstrained
run underconstrained
run both
