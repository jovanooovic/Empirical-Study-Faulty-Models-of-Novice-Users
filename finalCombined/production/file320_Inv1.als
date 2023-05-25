open util/ordering[Position]

// Consider the following model of an automated production line
// The production line consists of several positions in sequence
sig Position {}

// Products are either components assembled in the production line or 
// other resources (e.g. pre-assembled products or base materials)
sig Product {}

// Components are assembled in a given position from other parts
sig Component extends Product {
    parts : set Product,
    position : one Position
}
sig Resource extends Product {}

// Robots work somewhere in the production line
sig Robot {
        position : one Position
}
pred Inv1 { // A component requires at least one part
iden in ~parts.parts
}


pred Inv1C { // A component requires at least one part
	all c:Component | some c.parts 
}
pred overconstrained { Inv1C and !Inv1}
pred underconstrained { !Inv1C and Inv1}
pred both { Inv1C and Inv1 }

run overconstrained
run underconstrained
run both
