accessing
addBreed: aBreed
	| bno |
	bno := aBreed breedNo.
	bno = SBreedId observerBreedNo
		ifTrue: [ ^ self ].
	bno = SBreedId patchBreedNo
		ifTrue: [ ^ self ].
	plugin setupBreed: bno.