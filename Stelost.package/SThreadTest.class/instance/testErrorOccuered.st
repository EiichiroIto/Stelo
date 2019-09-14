tests-private
testErrorOccuered
	| t |
	t := SThread sworld: SMicroWorld new.
	self assert: t isTerminated equals: false.
	t errorOccuered.
	self assert: t isTerminated equals: true.