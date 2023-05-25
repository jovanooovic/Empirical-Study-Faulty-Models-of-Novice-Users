sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv3 {
  all s1, s2 : State | lone (s1.trans.s2)  
}


pred inv3C {
	all s : State, e : Event | lone e.(s.trans)
}
pred overconstrained { inv3C and !inv3}
pred underconstrained { !inv3C and inv3}
pred both { inv3C and inv3 }

run overconstrained
run underconstrained
run both
