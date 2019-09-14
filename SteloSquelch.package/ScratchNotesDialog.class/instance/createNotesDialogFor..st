initialization
createNotesDialogFor: aScratchFrameMorph
	"Create a Scratch project notes dialog box."

	| commentFont |
	commentFont := (ScratchFrameMorph getFont: #ProjectNotes).

	commentMorph := ScrollingStringMorph new
		borderWidth: 0;
		contents: '';
		font: commentFont;
		backForm: (ScratchFrameMorph skinAt: #stringFieldFrame);
		textColor: ScratchFrameMorph dialogBoxTextColor;
		width: 300.

	self title: 'Project Notes' localized.
	mainColumn addMorphBack: commentMorph.
	mainColumn addMorphBack: buttonRow.

	scratchFrame := aScratchFrameMorph.
	commentMorph contents: scratchFrame projectCommentOrTemplate.
	bottomSpacer delete.
	bottomSpacer := nil.

	tabFields add: commentMorph.
