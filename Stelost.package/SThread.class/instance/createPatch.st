observer ops
createPatch
	| count |
	count := self pop.
	world createPatchOrder: count asInteger.