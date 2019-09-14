adding
addAndView: aSpriteMorph
	"Add given morph to the work pane and view it."

	| pos i p |
	aSpriteMorph center: workPane center.
	pos := self scratchObjects collect: [:o | o referencePosition].
	i := 0.
	[pos includes: (p := (10 * i) asPoint)] whileTrue: [i := i + 1].
	workPane addMorphFront: aSpriteMorph.
	aSpriteMorph objName: aSpriteMorph instanceName.
	aSpriteMorph referencePosition: p.
	aSpriteMorph startStepping.
	workPane addSprite: aSpriteMorph.
	self view: aSpriteMorph tab: 'Scripts' category: 'basic'.