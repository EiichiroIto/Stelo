accessing
colors
	| num ext |
	num := plugin sizeOf: SBreedId patchBreedNo.
	ext := plugin getScreen.
	^ [ ext copyFrom: 1 to: num ]
		ensure: [ ext release ]