stelo
import: anImporter extension: aString
	| response fr f code |
	self closeMediaEditorsAndDialogs
		ifFalse: [ ^ self ].
	self stopAll.
	response := ScratchFileChooserDialog
		chooseExistingFileType: #project
		extensions: {aString}
		title: 'Import ...'.
	response ifNil: [ ^ self ].
	fr := response asFileReference.
	fr exists
		ifFalse: [ ^ self ].
	[ f := fr readStream.
	code := f contents.
	f close ]
		ifError:
			[ f ifNotNil: [ f close ].
			^ self
				inform: 'Could not read file'
				withDetails: 'Import failed' localized ].
	anImporter import: code to: workPane.
	workPane restoreBreeds.