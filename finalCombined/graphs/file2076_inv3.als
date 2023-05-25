sig Node {
	adj : set Node
}
pred acyclic {
+adj not in id
}

pred acyclicC {
	all a:Node | a not in a.^adj
}
pred overconstrained { inv3C and !inv3}
pred underconstrained { !inv3C and inv3}
pred both { inv3C and inv3 }

run overconstrained
run underconstrained
run both
