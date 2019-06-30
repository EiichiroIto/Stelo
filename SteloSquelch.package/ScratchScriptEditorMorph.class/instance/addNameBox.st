initialization
addNameBox

	nameMorph := UpdatingStringFieldMorph new
		font: (ScratchFrameMorph getFont: #UpdatingStringField);
		rightJustify: ScratchTranslator isRTL;
		acceptWhenFocusLost: true;
		position: self position + (37@16).

	self addMorphBack: nameMorph.
