private
setPatchColor: anInteger at: aPoint
	| index |
	index := sworld patchIndexAtX: aPoint x y: aPoint y.
	sworld
		var: SPatchVarId colorVarNo
		breed: SBreedId patchBreedNo
		at: index
		put: anInteger.
	steloDisplay changed