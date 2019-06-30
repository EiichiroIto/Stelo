stelo
startStageRecording
	| fName response fr |
	fName := ScratchFileChooserDialog
		chooseNewFileDefault: ''
		title: 'Start Stage Recording'
		type: #scriptsSnapshot.
	fName = #cancelled
		ifTrue: [ ^ self ].
	fName size = 0
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
		microworld: workPane microworld;
		extent: 200 @ 200.