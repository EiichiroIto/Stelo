enumerating
turtleBreedsDo: aBlock
	(breeds copyFrom: SBreedId defaultUserNo to: breedId size)
		do: [ :each | aBlock value: each ]