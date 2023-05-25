sig Node {
	adj : set Node
}
pred stonglyConnected {
all n:Node | Node-n in n.(*adj + *~adj)
}

pred stonglyConnectedC {
	all n:Node | Node in n.*adj
}
pred overconstrained { inv7C and !inv7}
pred underconstrained { !inv7C and inv7}
pred both { inv7C and inv7 }

run overconstrained
run underconstrained
run both
