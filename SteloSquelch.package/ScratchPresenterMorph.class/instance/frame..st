initialization
frame: aScratchFrameMorph
	frame := aScratchFrameMorph.
	stage := aScratchFrameMorph workPane.
	stage updateDisplay: false.
	steloDisplay := SDisplay sworld: stage sworld.
	steloDisplay topLeft: self topLeft.
	self addMorphBack: steloDisplay.