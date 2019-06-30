variable ops
getVar
	| var ret |
	var := self pop.
	ret := world var: var breedNo: breedId at: id.
	self push: ret.