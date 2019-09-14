initialization
addNameBox

	nameMorph := UpdatingStringFieldMorph new
		font: (ScratchFrameMorph getFont: #UpdatingStringField);
		acceptWhenFocusLost: true;
		position: self position + (37@16).

	self addMorphBack: nameMorph.
