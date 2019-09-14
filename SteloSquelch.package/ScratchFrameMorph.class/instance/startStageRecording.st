stelo
startStageRecording
	| fName response fr |
	fName := ScratchFileChooserDialog
		chooseNewFileDefault: ''
		title: 'Start Stage Recording'
		type: #scriptsSnapshot.
	(fName isEmpty or: [fName = #cancelled])
		ifTrue: [ ^ self ].
	(fName asLowercase endsWith: '.gif')
		ifFalse: [ fName := fName , '.gif' ].
	fr := fName asFileReference.
	fr exists
		ifTrue: [ response := DialogBoxMorph
				ask: 'Are you sure you want to delete the file''' , fName , '''?'.
			response
				ifFalse: [ ^ self ].
			fr delete ].
	stageRecorder := SRecorder new
		openFileNamed: fName;
		sworld: workPane sworld;
		extent: 200 @ 200.