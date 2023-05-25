sig Node {
	adj : set Node
}
pred weaklyConnected {
all n1,n2:Node | n1 in n2.^adj || n2 in n1.^adj
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
