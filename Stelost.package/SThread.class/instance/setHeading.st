variable ops
setHeading
	| degrees |
	breedId <= SBreedId patchBreedNo
		ifTrue: [ ^ self ].
	degrees := self pop.
	world var: STurtleVarId headingVarNo breedNo: SBreedId turtleBreedNo at: id put: degrees.