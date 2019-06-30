execution
executeThread: code breedNo: bno index: index ifTerminatedDo: aBlock
	| thread |
	thread := SThread microworld: world.
	thread forBreedNo: bno index: index.
	thread execute: code.
	thread isTerminated
		ifTrue: [ aBlock value ].