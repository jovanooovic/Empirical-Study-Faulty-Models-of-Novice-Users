sig Node {
	adj : set Node
}
pred stonglyConnected {
*adj & Node

/*
The graph is transitive, ie, if two nodes are connected through a third node, they also are connected directly.
pred stonglyConnectedC {
	all n:Node | Node in n.*adj
}
pred overconstrained { inv7C and !inv7}
pred underconstrained { !inv7C and inv7}
pred both { inv7C and inv7 }

run overconstrained
run underconstrained
run both
