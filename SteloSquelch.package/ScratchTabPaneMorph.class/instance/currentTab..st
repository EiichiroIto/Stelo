accessing
currentTab: aString

	currentTab := aString.
	self targetPane ifNil: [^ self].

	(targetPane target isKindOf: SteloStageMorph)
		ifTrue: [self setLabelForTab: 'Costumes' to: 'Backgrounds' localized]
		ifFalse: [self setLabelForTab: 'Costumes' to: 'Costumes' localized].

	self lightUpCurrentTab.
	targetPane currentCategory: aString.
