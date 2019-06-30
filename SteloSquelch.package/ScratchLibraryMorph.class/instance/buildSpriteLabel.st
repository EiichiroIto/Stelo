initialization
buildSpriteLabel

	^ StringMorph new
		font: (ScratchFrameMorph getFont: #Tab);
		color: ScratchFrameMorph textColor;
		contents: 'New turtle:' localized
