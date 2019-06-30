turtle ops
turtleAt
	| x y ret bid |
	bid := self pop.
	y := self pop.
	x := self pop.
	ret := world turtle: bid x: x y: y exceptBreedNo: breedId index: id.
	self push: ret.