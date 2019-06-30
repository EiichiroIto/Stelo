other ops
eventReceived: event
	"Start all non-running stacks with an EventHat matching the given events and answer a collection of the new processes. If a process is already running for a given stack, don't start a new one."

	| targetScripts newProcs |
	targetScripts := #().
	targetScripts := self scripts select: [:s |
			(s class == EventHatMorph) and:
			 [(s eventName compare: event name) = 2]].
	
	newProcs := targetScripts asArray collect: [:script | script startForEvent: event].
	^ newProcs select: [:p | p notNil]

