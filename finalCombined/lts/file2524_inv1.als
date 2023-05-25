sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv1 {
	all s1, s2:State | some e:Event | s1->e->s2 in trans 
}


pred inv1C {
	all s: State | some s.trans
}
pred overconstrained { inv1C and !inv1}
pred underconstrained { !inv1C and inv1}
pred both { inv1C and inv1 }

run overconstrained
run underconstrained
run both
