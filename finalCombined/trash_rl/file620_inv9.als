sig File {
  	/* A file is potentially a link to other files. */
	link : set File
}
/* The set of files in the trash. */
sig Trash in File {}
/* The set of protected files. */
sig Protected in File {}
pred inv9 {
all f1:File,f2:File | not f1.link = f2.link
}


pred inv9C {
	no link.link
}
pred overconstrained { inv9C and !inv9}
pred underconstrained { !inv9C and inv9}
pred both { inv9C and inv9 }

run overconstrained
run underconstrained
run both
