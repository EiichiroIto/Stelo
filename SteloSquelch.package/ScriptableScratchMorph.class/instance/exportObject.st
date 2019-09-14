right button menu
exportObject
	| fName dir f str |
	fName := ScratchFileChooserDialog
		chooseNewFileDefault: objName
		title: 'Export Breed'
		type: #project.
	(fName isEmpty or: [ fName = #cancelled ])
		ifTrue: [ ^ self ].
	(fName endsWith: SteloTurtleMorph extension)
		ifFalse: [ fName := fName , SteloTurtleMorph extension ].
	fName := fName asFileReference basename.	
	dir := ScratchFileChooserDialog getLastFolderForType: #project.
	(dir / fName) isFile
		ifTrue: [ (DialogBoxMorph ask: 'Overwrite existing ' , fName , '?')
				ifFalse: [ ^ self ].
			(dir / fName) delete ].
	str := SSexpExporter new exportObject: self.
	f := nil.
	[ f := (dir / fName) writeStream.
	f nextPutAll: str.
	f close ]
		ifError: [ f ifNotNil: [ f close ].
			self
				inform: 'Could not write file'
				withDetails: 'Export failed' localized ]