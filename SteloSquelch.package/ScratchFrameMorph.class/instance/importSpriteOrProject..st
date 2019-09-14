accessing
importSpriteOrProject: fileName
	| fr data f morph |
	fr := fileName asFileReference.
	fr isFile
		ifFalse: [ ^ self ].
	f := fr readStream.
	f ifNil: [ ^ self ].
	data := f contents.
	f close.
	morph := self addNewTurtle.
	SSexpImporter new importScript: data to: morph.
	workPane layoutChanged.