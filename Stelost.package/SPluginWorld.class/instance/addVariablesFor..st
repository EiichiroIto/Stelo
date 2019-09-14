private
addVariablesFor: aBreed
	| bno |
	bno := aBreed breedNo.
	aBreed userDefinedVarNoAndNames
		do: [ :each | 
			| vno var |
			vno := each first.
			var := each second.
			plugin addVariable: var var: vno breed: bno ]