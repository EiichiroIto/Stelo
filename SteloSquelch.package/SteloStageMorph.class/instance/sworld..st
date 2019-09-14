accessing
sworld: aWorld
	sworld ifNotNil: [ self backupBreeds ].
	sworld := aWorld.
	breed sworld: sworld.
	self breeds do: [ :each | sworld addBreed: each ].
	self assert: (submorphs includes: steloDisplay).
	steloDisplay sworld: sworld.
	self restoreBreeds