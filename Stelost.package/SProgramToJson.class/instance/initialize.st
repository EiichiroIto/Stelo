initialization
initialize
	super initialize.
	breeds := Dictionary new.
	stream := WriteStream on: String new.