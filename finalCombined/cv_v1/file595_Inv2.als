abstract sig Source {}
sig User extends Source {
    profile : set Work,
    visible : set Work
}
sig Institution extends Source {}

sig Id {}
sig Work {
    ids : some Id,
    source : one Source
}
pred Inv2 { // A user profile can only have works added by himself or some external institution
all u : Use | some w : Work | u->w in profile implies (Institution in w.source or User in w.source)
}


pred Inv2C {
		all u:User, w:Work | w in u.profile implies (u in w.source or some i:Institution | i in w.source)
}
pred overconstrained { Inv2C and !Inv2}
pred underconstrained { !Inv2C and Inv2}
pred both { Inv2C and Inv2 }

run overconstrained
run underconstrained
run both
