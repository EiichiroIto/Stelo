variable ops
setColorTo
	| color |
	color := self pop.
	world var: SVarId colorVarNo breed: breedId at: id put: color.