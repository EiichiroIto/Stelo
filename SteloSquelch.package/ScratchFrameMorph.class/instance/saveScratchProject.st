file read/write
saveScratchProject
	| fName result |
	self closeMediaEditorsAndDialogs
		ifFalse: [ ^ self ].
	self stopAll.
	fName := ScratchFileChooserDialog saveScratchFileFor: self.
	(fName isEmpty or: [ fName = #cancelled ])
		ifTrue: [ ^ self ].
	[ (result := ScratchFileChooserDialog
		confirmFileOverwriteIfExisting: fName) = false ]
		whileTrue: [ fName := ScratchFileChooserDialog saveScratchFileFor: self.
			(fName isEmpty or: [ fName = #cancelled ])
				ifTrue: [ ^ self ] ].
	result = #cancelled
		ifTrue: [ ^ self ].
	self updateLastHistoryEntryIfNeeded.
	fName := (self nameFromFileName: fName)
		, ScratchFileChooserDialog extension.
	projectDirectory := fName asFileReference parent.
	projectName := fName asFileReference basename.
	projectInfo at: 'author' put: author.
	self updateHistoryProjectName: projectName op: 'save'.
	self writeScratchProject