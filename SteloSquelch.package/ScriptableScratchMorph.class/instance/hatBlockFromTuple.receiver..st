blocks
hatBlockFromTuple: tuple receiver: scriptOwner
	"Answer a new block for the given variable reference tuple."

	| blockClass block eventName |
	blockClass := Smalltalk at: tuple first.
	block := blockClass new scriptOwner: scriptOwner.
	blockClass = EventHatMorph
		ifTrue: [ eventName := tuple at: 2.
			eventName = 'startup'
				ifTrue: [ block
						forStartupEvent;
						scriptOwner: scriptOwner.
					^ block ].
			eventName = 'setup'
				ifTrue: [ block
						forSetupEvent;
						scriptOwner: scriptOwner.
					^ block ].
			eventName = 'loop'
				ifTrue: [ block
						forLoopEvent;
						scriptOwner: scriptOwner.
					^ block ].
			block eventName: eventName.
			^ block ].
	^ block.