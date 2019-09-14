initialization
createScratchFileChooserFor: aScratchFrameMorph saving: savingFlag
	"Create a Scratch file chooser dialog box with a project thumbnail and info box."

	| labelFont contentsFont commentFont thumbnailHolder |
	scratchFrame := aScratchFrameMorph.
	readingScratchFile := savingFlag not.

	list := ScratchFilePicker new extensions: #(scratch sl).
	self removeAllMorphs.
	bottomSpacer delete.
	bottomSpacer := nil.
	mainColumn addMorphBack: list.

	savingFlag ifFalse: [
		self title: 'Open Project'.
		list scratchInfoClient: self].

	labelFont := (ScratchFrameMorph getFont: #FileChooserLabel).
	contentsFont := (ScratchFrameMorph getFont: #FileChooserContents).
	commentFont := (ScratchFrameMorph getFont: #FileChooserComment).

	savingFlag ifTrue: [
		self title: 'Save Project'.
		newFileTitle := StringMorph contents: ('New Filename:' localized, ' ') font: labelFont.
		newFileTitle color: ScratchFrameMorph dialogBoxTextColor.
		newFileName := StringFieldMorph new
			contents: scratchFrame projectName;
			client: self;
			font: contentsFont;
			color: ScratchFrameMorph fieldColor;
			width: 180.
		tabFields add: newFileName.
		newTitleBin
			addMorphBack: newFileTitle;
			addMorphBack: (Morph new extent: (5@5); color: Color transparent);
			addMorphBack: newFileName;
			addMorphBack: (AlignmentMorph newSpacer: Color transparent).
		ScratchTranslator isRTL
			ifTrue: [newTitleBin submorphs reversed do: [:m |
				m delete.
				newTitleBin addMorphBack: m]]].
	mainColumn
		addMorphBack: (Morph new extent: (5@9); color: Color transparent);
		addMorphBack: newTitleBin.

	thumbnailHolder := AlignmentMorph newColumn
		wrapCentering: #center;
		color: Color transparent.
	thumbnailFrameMorph := ImageFrameMorph2 new
		initFromForm: (ScratchFrameMorph skinAt: #dialogThumbnailFrame).
	thumbnailFrameMorph extent: (170@130).
	thumbnailHolder addMorph: thumbnailFrameMorph.
	fileInfoColumn
		addMorphBack: thumbnailHolder;
		addMorphBack: (Morph new extent: (5@6); color: Color transparent). "spacer"
	thumbnailMorph := ImageMorph new form: (Form extent: 160@120 depth: 1).
	thumbnailFrameMorph addMorphFront: (thumbnailMorph position: ((thumbnailFrameMorph position) + (5@5))).

	authorLabelMorph := StringMorph contents: 'Project author:' localized font: labelFont.
	authorLabelMorph color: ScratchFrameMorph dialogBoxTextColor.
	fileInfoColumn addMorphBack: authorLabelMorph.
	savingFlag
		ifTrue: [authorMorph := StringFieldMorph new
			useStringFieldFrame;
			contents: '';
			font: contentsFont.
			tabFields add: authorMorph]
		ifFalse: [fileInfoColumn addMorphBack: (Morph new extent: (5@6); color: Color transparent). "spacer"
			authorMorph := StringFieldMorph new
				color: Color transparent;
				borderWidth: 0;
				contents: '';
				isEditable: false;
				font: contentsFont].
	fileInfoColumn
		addMorphBack: authorMorph;
		addMorphBack: (Morph new extent: (5@6); color: Color transparent). "spacer"

	commentLabelMorph := StringMorph contents: 'About this project:' localized font: labelFont.
	commentLabelMorph color: authorLabelMorph color.
	fileInfoColumn addMorphBack: commentLabelMorph.
	commentMorph := ScrollingStringMorph new
		borderWidth: 0;
		contents: '';
		font: commentFont;
		textColor: ScratchFrameMorph dialogBoxTextColor;
		extent: (210@110).
	savingFlag
		ifTrue: [commentMorph backForm: (ScratchFrameMorph skinAt: #stringFieldFrame).
			tabFields add: commentMorph]
		ifFalse: [commentMorph isEditable: false].
	fileInfoColumn addMorphBack: commentMorph.

	fileInfoColumn addMorphBack: buttonRow.
	self
		addMorphBack: shortcutColumn;
		addMorphBack: mainColumn;
		addMorphBack: fileInfoColumn.

	savingFlag ifTrue: [
		self scratchInfo: scratchFrame projectInfo.
		thumbnailMorph form: scratchFrame workPane thumbnailForm.
		authorMorph contents: aScratchFrameMorph author].