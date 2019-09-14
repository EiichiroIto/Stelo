accessing
exportFrom: aStageMorph
	| program |
	aStageMorph setupEvents.
	program := aStageMorph program.
	^ SProgramToJson new fromProgram: program