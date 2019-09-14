stelo
setStageSize
	| ret |
	ret := StringDialog ask: 'Enter Number (more than patch order)'.
	ret isEmpty
		ifTrue: [ ^ self ].
	ret := ret asNumberNoError.
	ret < workPane sworld extent x
		ifTrue: [ ^ DialogBoxMorph inform: 'Invalid Number' ].
	stageRecorder extent: ret @ ret.