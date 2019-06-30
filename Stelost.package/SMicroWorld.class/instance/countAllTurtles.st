private
countAllTurtles
	| ret |
	ret := 0.
	SBreedId defaultUserNo to: breeds size do: [ :each | ret := ret + (breeds at: each) count ].
	^ ret