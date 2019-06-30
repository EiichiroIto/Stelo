accessing
clickedAt: aPoint
	| frame breedNo |
	frame := self frameMorph.
	frame ifNil: [ ^ self ].
	breedNo := frame targetSprite breedNo.
	breedNo = SBreedId observerBreedNo
		ifTrue: [ ^ self ].
	breedNo = SBreedId patchBreedNo
		ifTrue: [ self setPatchColor: 15 at: aPoint ]
		ifFalse: [ self createTurtles: 1 breedId: breedNo at: aPoint ].