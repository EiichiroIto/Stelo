instance creation
newScratchProject
	"Make a new, blank Scratch project."

	| response newProject sprite |
	self closeMediaEditorsAndDialogs ifFalse: [^ self].
	self stopAll.

	(justSaved or: [self projectIsEmpty]) ifFalse: [
		"ask the user if they want to save the current project"
		response := DialogBoxMorph askWithCancel: 'Save the current project?'.
		response = #cancelled ifTrue: [^ self].
		response ifTrue: [self saveScratchProjectNoDialog.
			justSaved ifFalse: [^ self]]].

	projectDirectory := ScratchFileChooserDialog getDefaultFolderForType: #project.
	projectName := ''.
	projectInfo := Dictionary new.

	newProject := SteloStageMorph new.
	self installNewProject: newProject.

	sprite := workPane newPatch.
	self addAndView: sprite.
	self addNewTurtle.
	workPane restoreBreeds.

	"self initializeWatcherPositions."
	justSaved := true.
	"self enterNormalMode."
