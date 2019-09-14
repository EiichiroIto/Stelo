file read/write
openScratchProjectNamed: fName
	"Open a Scratch project with the given name."

	| f projData newProj file |
	self closeMediaEditorsAndDialogs
		ifFalse: [ ^ self ].
	file := fName asFileReference.
	f := file binaryReadStream.
	f ifNil: [ ^ self inform: 'Could not read' withDetails: fName ].
	[ projData := f contents.
	newProj := self extractProjectFrom: projData.
	projectInfo := self extractInfoFrom: projData ]
		ifError: [ :err :rcvr | 
			^ self
				inform: 'Could not read project; file may be damaged'
				withDetails: '(' , err , ')' ].
	projectDirectory := file parent.
	ScratchFileChooserDialog
		setLastFolderTo: projectDirectory
		forType: #project.
	projectName := file basename.
	self installNewProject: newProj.
	viewerPane updateContents