startup
readSettingsFile
	"Read my settings file and answer a Dictionary of settings."
	"ScratchFrameMorph new readSettingsFile"

	| f dict s tokens k |
	self settingFileName asFileReference exists ifFalse: [ ^ Dictionary new ].
	f := FileStream readOnlyFileNamed: self settingFileName.
	dict := Dictionary new.
	f contentsOfEntireFile lines do: [:line |
		s := line collect: [:c | (c asciiValue < 32) ifTrue: [Character space] ifFalse: [c]].
		tokens := s findTokens: '='.
		k := tokens first trimBoth asLowercase.
		tokens size = 2
			ifTrue: [dict at: k put: tokens second trimBoth]
			ifFalse: [dict at: k put: '1']].
	^ dict
