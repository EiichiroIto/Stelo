variable ops
setPatchColorTo
	| color pid |
	color := self pop.
	pid := self pop.
	world var: SPatchVarId colorVarNo breed: SBreedId patchBreedNo at: pid put: color.