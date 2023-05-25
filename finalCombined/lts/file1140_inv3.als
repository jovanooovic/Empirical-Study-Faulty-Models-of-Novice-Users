sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv3 {
  all s:State | e1,e2:Event | e1->s in s.trans and e2->s in s.trans implies e1=e2
	
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
