stelo
export: anExporter extension: aString
	| fName dir f ext str |
	ext := '.' , aString.
	fName := ScratchFileChooserDialog
		chooseNewFileDefault: self projectName
		title: 'Export ...'
		type: #export.
	fName = #cancelled
		ifTrue: [ ^ self ].
	fName isEmpty
		ifTrue: [ ^ self ].
	(fName endsWith: ext)
		ifFalse: [ fName := fName , ext ].
	fName := fName asFileReference basename.
	dir := ScratchFileChooserDialog getLastFolderForType: #export.
	(dir / fName) isFile
		ifTrue: [ (DialogBoxMorph ask: 'Overwrite existing ' , fName , '?')
				ifFalse: [ ^ self ].
			(dir / fName) delete ].
	f := nil.
	[ f := (dir / fName) writeStream.
	str := anExporter exportFrom: workPane.
	f nextPutAll: str.
	f close ]
		ifError: [ f ifNotNil: [ f close ].
			self
				inform: 'Could not write file'
				withDetails: 'Export failed' localized ]