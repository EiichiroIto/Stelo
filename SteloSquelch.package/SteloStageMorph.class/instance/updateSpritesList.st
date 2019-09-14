accessing
updateSpritesList
	| frame |
	frame := self meOrOwnerThatIsA: ScratchFrameMorph.
	frame ifNil: [ ^ self ].
	sprites := OrderedCollection new.
	frame libraryPane spriteThumbnails
		do: [ :m | m target ifNotNil: [ sprites addLast: m target ] ].
	self backupBreeds.