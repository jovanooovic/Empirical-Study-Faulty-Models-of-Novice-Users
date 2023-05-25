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

pred inv12 {
all t:Teacher,c:Class | some g:Group | c->t->g in Groups implies t->c in Teaches
}




pred inv12C {
 all t : Teacher | some (t.Teaches).Groups
}
pred overconstrained { inv12C and !inv12}
pred underconstrained { !inv12C and inv12}
pred both { inv12C and inv12 }

run overconstrained
run underconstrained
run both
