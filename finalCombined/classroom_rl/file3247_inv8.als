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

pred inv8 {
all t : Teacher , c : Class | lone t->c in Teaches

/* No class has more than a teacher assigned. */
pred inv9 {
all c : Class , t,u : Teacher | t->c in Teaches and u->c in Teaches implies t=u
}
pred inv8C {
  all t:Teacher | lone t.Teaches
}
pred overconstrained { inv8C and !inv8}
pred underconstrained { !inv8C and inv8}
pred both { inv8C and inv8 }

run overconstrained
run underconstrained
run both
