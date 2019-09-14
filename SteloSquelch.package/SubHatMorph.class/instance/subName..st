accessing
subName: aString
	subName := aString.
	scriptNameMorph contents: ('Sub ', aString).
	self fixBlockLayout.
	(self meOrOwnerThatIsA: ScratchViewerMorph)
		ifNotNil: [ :morph | morph updateContents ]