stelo
changeMicroWorld
	sworldMode = #SMicroWorld
		ifTrue: [ ^ self ].
	sworldMode := #SMicroWorld.
	workPane sworld: self newSWorld.