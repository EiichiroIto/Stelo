private
setAllVariables: aBreed
	| bno |
	bno := aBreed breedNo.
	aBreed varNames
		do: [ :each | 
			| vno list |
			vno := aBreed varNoFor: each.
			list := aBreed varArrayNamed: each.
			self setAllVariable: vno breed: bno list: list ]