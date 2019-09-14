instance creation
openScratchFileFor: aScratchFrameMorph
	"Choose a Scratch project file for reading. Answer:
		nil, if no file is selected
		the full file name, if a local file is selected
		a ByteArray containing the project data, if a remote file is selected.
	As the user selects files in the file picker, preview the project thumbnail and info string for the selected project. If the file 'servers.txt' is found in the Scratch folder, then allow browsing and selecting of Scratch projects on a remote HTTP server."

	"ScratchFileChooserDialog openScratchFileFor: nil"

	| m response |
	self deleteDuplicates.
	m := self new
		createScratchFileChooserFor: aScratchFrameMorph saving: false;
		type: #project.
	response := m getUserResponse.
	response = #cancelled
		ifTrue: [ ^ nil ].
	^ response