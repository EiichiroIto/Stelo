initialization
frame: aScratchFrameMorph
	frame := aScratchFrameMorph.
	stage := aScratchFrameMorph workPane.
	stage updateDisplay: false.
	steloDisplay := SDisplay microworld: stage microworld.
	steloDisplay topLeft: self topLeft.
	self addMorphBack: steloDisplay.