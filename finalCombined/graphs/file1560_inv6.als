sig Node {
	adj : set Node
}
pred weaklyConnected {
all n1:Node | ((^adj.n1:>Node) + (n1.^adj:>Node) + (n1.^adk:>n1)) = Node
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
