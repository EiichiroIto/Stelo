initialization
initialize
	super initialize.
	plugin := SteloLibCall new.
	plugin reset.
	plugin createPatch: 100.