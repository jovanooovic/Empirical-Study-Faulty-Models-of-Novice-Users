sig Node {
	adj : set Node
}
pred weaklyConnected {
all n, x :Node | some n2:Node | n in (n2.*adj + ~(~adj).x)

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
