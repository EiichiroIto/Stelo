accessing
newBreed
	| bid |
	bid := breedId newNo.
	breeds := breeds forceTo: bid paddingWith: (STurtles new breedId: bid).
	^ bid