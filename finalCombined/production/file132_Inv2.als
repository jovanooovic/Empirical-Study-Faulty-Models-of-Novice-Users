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
pred Inv2 { // A component cannot be a part of itself
all c : Component | c->c not in parts
}


pred Inv2C { // A component cannot be a part of itself
		all c:Component | c not in c.^parts
}
pred overconstrained { Inv2C and !Inv2}
pred underconstrained { !Inv2C and Inv2}
pred both { Inv2C and Inv2 }

run overconstrained
run underconstrained
run both
