sig Node {
	adj : set Node
}
pred complete {
adj = Node -> Node

/*
The graph contains no loops, ie, nodes have no transitions to themselves.
pred completeC {
	all n:Node | Node in n.adj
}
pred overconstrained { inv4C and !inv4}
pred underconstrained { !inv4C and inv4}
pred both { inv4C and inv4 } 

run overconstrained
run underconstrained
run both
