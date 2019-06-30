tests-private
testErrorOccuered
	| t |
	t := SThread microworld: SMicroWorld new.
	self assert: t isTerminated equals: false.
	t errorOccuered.
	self assert: t isTerminated equals: true.