scratch processes/events
program
	| program |
	program := SProgram new.
	self setupProgram: program for: self.
	self sprites do: [ :each | self setupProgram: program for: each ].
	^ program