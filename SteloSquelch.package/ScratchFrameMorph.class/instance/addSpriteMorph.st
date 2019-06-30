menu/button actions
addSpriteMorph
	| result |
	result := ScratchFileChooserDialog chooseSpriteCostumeFor: self.
	result = #cancelled
		ifTrue: [ ^ self ].
	(result asLowercase endsWith: '.turtle')
		ifTrue: [ ^ self importSpriteOrProject: result ].