sig Node {
	adj : set Node
}
pred stonglyConnected {
all n1,n2:Node | n2 in n1.*adj
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
