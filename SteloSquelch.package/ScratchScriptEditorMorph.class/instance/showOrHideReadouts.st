private
showOrHideReadouts
	"If this is a sprite, show the position and direction readouts and the rotation style buttons. Otherwise, hide them."

	self deleteReadouts.
	nameMorph
		font: nameMorph font;
		width: nameMorph height * 4.
	self target ifNil: [ ^ self ].
	self target isTurtle
		ifFalse: [ ^ self ].
	self addReadouts.
	self world ifNotNil: [ self world startSteppingSubmorphsOf: self ]