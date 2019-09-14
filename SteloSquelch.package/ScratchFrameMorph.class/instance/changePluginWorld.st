stelo
changePluginWorld
	sworldMode = #SPluginWorld
		ifTrue: [ ^ self ].
	sworldMode := #SPluginWorld.
	workPane sworld: self newSWorld.