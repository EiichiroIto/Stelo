stelo
stopStageRecording
	stageRecorder ifNil: [ ^ self ].
	stageRecorder close.
	stageRecorder := nil.