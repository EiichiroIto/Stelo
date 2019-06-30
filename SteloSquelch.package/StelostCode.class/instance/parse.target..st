accessing
parse: aTopBlock target: aMorph
	targetMorph := aMorph.
	bcGenerator := SBytecodeGenerator new.
	(ScratchBlockParser codeGenerator: self) parseBlock: aTopBlock.
	^ bcGenerator code.