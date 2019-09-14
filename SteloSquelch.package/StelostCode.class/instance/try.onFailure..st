private
try: aBlock onFailure: anErrorBlock
	ScratchFrameMorph useErrorCatcher
		ifTrue: [ aBlock ifError: anErrorBlock ]
		ifFalse: aBlock