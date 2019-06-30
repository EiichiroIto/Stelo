scratch processes/events
program
	| program |
	program := SProgram new.
	self setupProgram: program for: self from: self hatBlocks.
	self sprites do: [ :each | self setupProgram: program for: each from: each hatBlocks ].
	^ program