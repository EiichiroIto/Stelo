menu/button actions
addSpriteMorph
	| result |
	result := ScratchFileChooserDialog
		chooseExistingFileType: #project
		extensions: #(turtle)
		title: 'New Breed'.
	result = #cancelled
		ifTrue: [ ^ self ].
	(result asLowercase endsWith: SteloTurtleMorph extension)
		ifTrue: [ ^ self importSpriteOrProject: result ]