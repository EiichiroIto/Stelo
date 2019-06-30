initialization
initialize
	super initialize.
	objName := self nextInstanceName.
	blocksBin := ScratchScriptsMorph new.