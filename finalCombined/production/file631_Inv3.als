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
pred Inv3 { // The position where a component is assembled must have at least one robot
all c:Component| some (position.(c.position) & Robot)
}


pred Inv3C { // The position where a component is assembled must have at least one robot
	Component.cposition in Robot.rposition
}

pred overconstrained { Inv3C and !Inv3}
pred underconstrained { !Inv3C and Inv3}
pred both { Inv3C and Inv3 }

run overconstrained
run underconstrained
run both
