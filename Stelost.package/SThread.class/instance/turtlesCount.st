observer ops
turtlesCount
	| bid |
	bid := self pop.
	self push: (world countOfBreedNo: bid)