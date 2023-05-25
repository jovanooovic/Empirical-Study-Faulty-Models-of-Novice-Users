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

pred inv10 {
all c:Class, s:Student | some g:Group | s->g in c.Groups
}




pred inv10C {
  all c:Class, s:Student | some s.(c.Groups)
}
pred overconstrained { inv10C and !inv10}
pred underconstrained { !inv10C and inv10}
pred both { inv10C and inv10 }

run overconstrained
run underconstrained
run both
