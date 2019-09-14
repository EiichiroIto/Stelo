initialization
initialize
	super initialize.
	stepTime := 1000.
	stringMorph := StringMorph new
		contents: '';
		font: (StrikeFont fontName: 'Verdana' size: 12).
	self addMorph: stringMorph