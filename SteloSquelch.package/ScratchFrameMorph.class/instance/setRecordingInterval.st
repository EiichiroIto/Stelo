stelo
setRecordingInterval
	| ret |
	ret := StringDialog ask: 'Enter Number (1..)'.
	ret isEmpty
		ifTrue: [ ^ self ].
	ret := ret asNumberNoError.
	ret < 1
		ifTrue: [ ^ DialogBoxMorph inform: 'Invalid Number' ].
	stageRecorder rate: ret.