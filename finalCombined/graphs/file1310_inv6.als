sig Node {
	adj : set Node
}
pred weaklyConnected {
all disj n,n1:Node | n in n1.^adj or n1 in n.^adj

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
