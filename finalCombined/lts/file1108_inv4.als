sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv4 {
	all s : State | some Init<:(s.trans)
}


pred inv4C {
 let tr = { s1, s2 : State | some e : Event | s1->e->s2 in trans } |
  State in Init.^tr
}
pred overconstrained { inv4C and !inv4}
pred underconstrained { !inv4C and inv4}
pred both { inv4C and inv4 } 

run overconstrained
run underconstrained
run both
