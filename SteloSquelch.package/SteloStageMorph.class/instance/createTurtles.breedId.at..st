private
createTurtles: anInteger1 breedId: bid at: aPoint
	| list |
	list := microworld create: bid turtles: anInteger1.
	list
		do: [ :each | 
			microworld x: bid at: each put: aPoint x.
			microworld y: bid at: each put: aPoint y ].
	steloDisplay changed