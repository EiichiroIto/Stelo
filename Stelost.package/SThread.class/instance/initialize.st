initialization
initialize
	super initialize.
	stack := OrderedCollection new.
	pc := 1.
	isTerminated := false.