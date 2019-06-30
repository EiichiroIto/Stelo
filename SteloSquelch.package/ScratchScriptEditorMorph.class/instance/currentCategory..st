accessing
currentCategory: aString

	| xOffset |
	currentCategory := aString.
	self target ifNil: [^ self].
	xOffset := 0.

	World activeHand newKeyboardFocus: nil.

	currentCategory = 'Scripts' ifTrue: [
		pageViewerMorph contents: self target blocksBin].

	pageViewerMorph contents color: ScratchFrameMorph scriptsPaneColor.

	self world ifNotNil: [self world startSteppingSubmorphsOf: pageViewerMorph contents].

