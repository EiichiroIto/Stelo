tests-accessing
testColors
	| w |
	w := SMicroWorld new.
	w createPatchOrder: 3.
	self assertCollection: w colors equals: #[0 0 0 0 0 0 0 0 0].
	w create: 3 turtles: 1.
	(w breedsOf: 3) colorAt: 1 put: 12.
	self assertCollection: w colors equals: #[0 0 0 0 12 0 0 0 0].
	w patches colorAt: 1 put: 23.
	self assertCollection: w colors equals: #[23 0 0 0 12 0 0 0 0]