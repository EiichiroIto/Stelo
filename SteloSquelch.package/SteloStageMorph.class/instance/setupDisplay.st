private
setupDisplay
	steloDisplay := SDisplay new.
	steloDisplay topLeft: self topLeft.
	self addMorphBack: steloDisplay.