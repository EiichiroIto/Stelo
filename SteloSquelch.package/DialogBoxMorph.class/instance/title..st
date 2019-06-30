accessing
title: aString
	"Note: Title is actually two StringMorphs with the same contents and font: a gray shadow of the text with a white submorph of the same text, offset by a small amount."

	titleBin ifNotNil: [titleBin delete].
	titleBin removeAllMorphs.
	titleMorph ifNotNil: [titleMorph delete].

	titleMorph := StringMorph new
		contents: aString localized;
		color: ScratchFrameMorph dialogBoxTitleColor;
		font: (ScratchFrameMorph getFont: #DialogBoxTitle).

	titleBin
		addMorph: (AlignmentMorph newSpacer: Color transparent);
		addMorph: (Morph new extent: (5@5); color: Color transparent);
		addMorph: titleMorph;
		addMorph: (AlignmentMorph newSpacer: Color transparent).


	self addMorphBack: titleBin.
	self changed.
