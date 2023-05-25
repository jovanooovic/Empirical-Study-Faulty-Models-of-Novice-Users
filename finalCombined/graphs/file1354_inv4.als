sig Node {
	adj : set Node
}
pred complete {

 
 all a,b : Node | a->b in adj
}
pred completeC {
	all n:Node | Node in n.adj
}
pred overconstrained { inv4C and !inv4}
pred underconstrained { !inv4C and inv4}
pred both { inv4C and inv4 } 

run overconstrained
run underconstrained
run both
