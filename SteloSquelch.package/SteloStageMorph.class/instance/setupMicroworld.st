private
setupMicroworld
	microworld := SMicroWorld new.
	microworld
		create: SBreedId turtleBreedNo
		turtles: self defaultTurtleCount;
		rewindBreedId.
	steloDisplay := SDisplay microworld: microworld.
	steloDisplay topLeft: self topLeft.
	self addMorphBack: steloDisplay.