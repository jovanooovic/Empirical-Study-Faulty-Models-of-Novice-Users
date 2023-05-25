sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv3 {
  all x, z, v : State, y : Event | x->y->z in trans and x->y->v in trans implies z=v

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
