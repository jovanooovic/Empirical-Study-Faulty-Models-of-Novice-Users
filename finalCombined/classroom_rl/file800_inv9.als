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

pred inv9 {
all c: Class | some t: Teacher | t->c in Teaches

}



pred overconstrained { inv9C and !inv9}
pred underconstrained { !inv9C and inv9}
pred both { inv9C and inv9 }

run overconstrained
run underconstrained
run both
