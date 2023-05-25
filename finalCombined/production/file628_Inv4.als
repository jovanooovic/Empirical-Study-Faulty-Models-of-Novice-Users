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
pred Inv4 { // The parts required by a component cannot be assembled in a later position
 all c:Component | (c.parts.position) in prevs(c.position)
}


pred Inv4C { // The parts required by a component cannot be assembled in a later position
  all c:Component | c.parts.cposition in c.cposition.*prev
}
pred overconstrained { Inv4C and !Inv4}
pred underconstrained { !Inv4C and Inv4}
pred both { Inv4c and Inv4 }

run overconstrained
run underconstrained
run both
