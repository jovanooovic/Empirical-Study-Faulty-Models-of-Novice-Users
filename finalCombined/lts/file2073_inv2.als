sig State {
        trans : Event -> State
}
sig Init in State {}
sig Event {}
pred inv2 {
	lone Init
}


pred inv2C {
	one Init
}
pred overconstrained { inv2C and !inv2}
pred underconstrained { !inv2C and inv2}
pred both { inv2C and inv2 }

run overconstrained
run underconstrained
run both
