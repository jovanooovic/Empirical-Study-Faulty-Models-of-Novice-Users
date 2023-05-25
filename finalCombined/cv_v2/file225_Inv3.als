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
pred Inv3 { // The works added to a profile by a given source cannot have common identifiers
all u:User | all w1,w2 : Work | (w1 in u.profile and w2 in u.profile and w1.ids=w2.ids) implies w1=w2)
}


pred Inv3C {
		all w1, w2 : Work, u : User | w1 != w2 and (w1 + w2) in u.profile and (w1.source = w2.source) implies no w1.ids & w2.ids
}
pred overconstrained { Inv3C and !Inv3}
pred underconstrained { !Inv3C and Inv3}
pred both { Inv3C and Inv3 }

run overconstrained
run underconstrained
run both
