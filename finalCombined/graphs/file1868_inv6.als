sig Node {
	adj : set Node
}
pred weaklyConnected {
all e1, e2 : Node | e2 in e1.*adj or e2 in *adj.e1 
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