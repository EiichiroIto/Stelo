adding
addNewTurtle
	| sprite |
	sprite := workPane newTurtle.
	self addAndView: sprite.
	^ sprite