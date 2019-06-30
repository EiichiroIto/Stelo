initialization
initialize

	super initialize.
	sprites := OrderedCollection new.
	objName := 'Observer' localized.
	updateDisplay := true.
	self setupMicroworld.