blocks
defaultArgsFor: blockSpec
	"Answer the default argument for the given block specification."

	| defaultArgs stage sel |
	defaultArgs := blockSpec copyFrom: 4 to: blockSpec size.	"may be empty"
	stage := self meOrOwnerThatIsA: SteloStageMorph.
	sel := (blockSpec at: 3) asSymbol.

	(#(broadcast: doBroadcastAndWait) includes: sel)
		ifTrue: [ stage ifNotNil: [ defaultArgs := Array with: stage defaultEventName ] ].

	#createTurtleSize:breedId: = sel
		ifTrue: [ | l |
			l := self turtleMorphs.
			l isEmpty
				ifFalse: [ defaultArgs := Array with: 100 with: l first ] ].

	^ defaultArgs.