variables
addVariable
	"Ask the user for a variable name, then add a user variable of that name. This version is for sprites and supports the option of making the variable specific to the sprite (i.e. local)."

	| sFrame result varName |
	(sFrame := self meOrOwnerThatIsA: ScratchFrameMorph) ifNil: [^ self beep].

	varName := StringDialog ask: 'Variable name?'.
	varName isEmpty ifTrue: [^ self].
	"varOwner := result second ifTrue: [self] ifFalse: [sFrame workPane]."
	(self variableNameInUse: varName) ifTrue: [
		self beep.
		DialogBoxMorph warn: 'That variable name is already in use'.
		^ self].

	self addVariable: varName.
	sFrame viewerPane categoryChanged: 'variables'.
	"self addWatcherForNewVariable: varName withScope: varOwner."
