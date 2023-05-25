sig Node {
	adj : set Node
}
pred weaklyConnected {
all n1, n2 : Node | some ((n1.^adj)->n2)
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
