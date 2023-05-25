sig Node {
	adj : set Node
}
pred weaklyConnected {
all x, y : Node | Node in x.*adj + y.*adj
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