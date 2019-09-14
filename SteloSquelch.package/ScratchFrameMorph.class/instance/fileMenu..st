menu/button actions
fileMenu: aMenuTitleMorph
	| menu |
	menu := MenuMorph new.
	menu defaultTarget: self.
	menu add: 'New' selector: #newScratchProject.
	menu add: 'Open' selector: #openScratchProject.
	menu add: 'Save' selector: #saveScratchProjectNoDialog.
	menu add: 'Save As' selector: #saveScratchProject.
	menu addLine.
	menu add: 'Import' localized subMenu: self importMenu.
	menu add: 'Export' localized subMenu: self exportMenu.
	menu add: 'Project Notes' selector: #editNotes.
	stageRecorder
		ifNil: [ menu add: 'Start Recording' selector: #startStageRecording ]
		ifNotNil: [ menu add: 'Stop Recording' selector: #stopStageRecording.
			menu add: 'Set Recoding Interval' selector: #setRecordingInterval.
			menu add: 'Set Size' selector: #setStageSize ].
	menu addLine.
	menu add: 'Send' selector: #sendJsonCode.
	Sensor shiftPressed
		ifTrue: [ "developer menu"
			menu addLine.
			fillScreenFlag
				ifTrue: [ menu add: 'Exit User Mode' selector: #fillScreenOff ]
				ifFalse: [ menu add: 'Enter User Mode' selector: #fillScreenOn.
					menu add: 'Save Image in User Mode' selector: #saveImageForEndUser.
					menu add: 'Close Scratch' selector: #delete ] ].
	menu addLine.
	menu add: 'Quit' selector: #quitScratch.
	menu localize.
	#(2 4 5 6 7)
		do: [ :n | 
			| item |
			item := menu items at: n.
			item contents: item contents , ScratchTranslator ellipsesSuffix ].
	menu invokeAt: aMenuTitleMorph bottomLeft + (0 @ 10) in: self world.