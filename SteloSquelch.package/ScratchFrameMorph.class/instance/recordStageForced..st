stelo
recordStageForced: aBoolean
	stageRecorder ifNil: [ ^ self ].
	stageRecorder writeForced: aBoolean.