variable ops
setColorTo
	| color |
	color := self pop.
	world var: SVarId colorVarNo breedNo: breedId at: id put: color.