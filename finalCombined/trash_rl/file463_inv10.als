sig File {
  	/* A file is potentially a link to other files. */
	link : set File
}
/* The set of files in the trash. */
sig Trash in File {}
/* The set of protected files. */
sig Protected in File {}
pred inv10 {
all f1,f2: File | f1->f2 in link && f1 in Trash implies f2 in Trash
}


pred inv10C {
	Trash.link in Trash
}
pred overconstrained { inv10C and !inv10}
pred underconstrained { !inv10C and inv10}
pred both { inv10C and inv10 }

run overconstrained
run underconstrained
run both