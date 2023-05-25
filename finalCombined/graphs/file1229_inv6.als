sig Node {
	adj : set Node
}
pred weaklyConnected {
all n: Node | Node = (n.^adj + n.^~adj)
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
