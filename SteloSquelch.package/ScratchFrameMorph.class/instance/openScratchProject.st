file read/write
openScratchProject
	"Allow the user to select a project to open, then open that project."

	| response |
	self closeMediaEditorsAndDialogs
		ifFalse: [ ^ self ].
	self stopAll.
	(justSaved or: [ self projectIsEmpty ])
		ifFalse: [ "ask the user if they want to save the current project"
			response := DialogBoxMorph askWithCancel: 'Save the current project?'.
			response = #cancelled
				ifTrue: [ ^ self ].
			response
				ifTrue: [ self saveScratchProjectNoDialog ] ].
	response := ScratchFileChooserDialog openScratchFileFor: self.
	response = #cancelled
		ifTrue: [ ^ self ].
	^ self openScratchProjectNamed: response