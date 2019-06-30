event handling
startDrag: evt

	(self target isKindOf: SteloStageMorph) ifTrue: [^ self]. "cannot drag stage thumbnail"

	(self meOrOwnerThatIsA: ScratchLibraryMorph)
		ifNil: [evt hand grabMorph: self]
		ifNotNil: [evt hand attachMorph: self fullCopy].
