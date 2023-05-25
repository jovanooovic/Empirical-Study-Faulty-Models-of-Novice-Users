sig Person  {
	/* Each person tutors a set of persons. */
	Tutors : set Person,
	/* Each person teaches a set of classes. */
	Teaches : set Class
}

/* The registered groups. */
sig Group {}

/* The registered classes. */
sig Class  {
	/* Each class has a set of persons assigned to a group. */
	Groups : Person -> Group
}

/* Some persons are teachers. */
sig Teacher in Person  {}

/* Some persons are students. */
sig Student in Person  {}

pred inv14 {
all p1, p2 : Person, c : Class | (some g : Group | c -> p2 -> g in Groups and p1 -> c in Teaches) implies (p1 -> p2 in Tutors)
}




pred overconstrained { inv14C and !inv14}
pred underconstrained { !inv14C and inv14}
pred both { inv14C and inv14 }

run overconstrained
run underconstrained
run both
