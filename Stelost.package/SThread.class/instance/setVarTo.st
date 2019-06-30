variable ops
setVarTo
	| var val |
	val := self pop.
	var := self pop.
	world
		var: var
		breedNo: breedId
		at: id
		put: val