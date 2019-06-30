instance creation
microworld: aWorld
	^ self basicNew
		initialize;
		microworld: aWorld;
		yourself.