variables
deleteVariable
	"Ask the user which user variable to delete, then remove it."

	| sFrame stage menu choice |
	sFrame := self meOrOwnerThatIsA: ScratchFrameMorph.
	sFrame ifNil: [^ self].

	(self varNames isEmpty)
		ifTrue: [^ self inform: 'No variables.' localized].

	menu := MenuMorph new.
	menu target: [ :v | choice := v ].
	self varNames do: [:v | menu add: v selector: #value: argument: v ].
	menu invokeAt: ActiveHand position in: self world.
	choice ifNil: [^ self].

	self deleteVariable: choice.

	sFrame viewerPane categoryChanged: 'variables'.
