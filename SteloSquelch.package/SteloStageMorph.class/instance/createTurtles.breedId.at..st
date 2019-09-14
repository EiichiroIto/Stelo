private
createTurtles: anInteger1 breedId: bid at: aPoint
	sworld setDefaultTurtle: bid at: aPoint.
	sworld create: bid turtles: anInteger1.
	sworld setDefaultTurtle: bid at: 0 @ 0.
	steloDisplay changed