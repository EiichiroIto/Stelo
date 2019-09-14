file read/write
writeScratchProject
	"Write this Scratch project to the file named projectFile in the project directory. Called by saveScratchProject."

	| oldScriptsTarget oldTab oldViewerCategory oldPosition saveError out tmpFile |
	self stopAll.
	self world ifNotNil: [ self world activeHand newKeyboardFocus: nil ].
	oldScriptsTarget := scriptsPane target.
	oldTab := scriptsPane tabPane currentTab.
	oldViewerCategory := viewerPane currentCategory.
	scriptsPane target: nil.
	workPane updateSpritesList.
	oldPosition := workPane position.
	workPane
		delete;
		position: 0 @ 0.
	ScriptableScratchMorph buildBlockSpecDictionary.
	workPane
		allMorphsDo: [ :m | 
			(m isKindOf: ScriptableScratchMorph)
				ifTrue: [ m blocksBin
						allMorphsDo: [ :b | 
							(b isKindOf: BlockMorph)
								ifTrue: [ b stop ] ].
					m convertStacksToTuples ] ].
	saveError := nil.
	tmpFile := (self unusedNameStartingWith: 'tmp' in: projectDirectory)
		asFileReference.
	[ out := tmpFile binaryWriteStream.
	out
		ifNil: [ saveError := 'Folder may be locked or read-only' ]
		ifNotNil: [ out nextPutAll: 'SteloV01' asByteArray.
			self storeProjectInfoOn: out.
			ObjStream new storeObj: workPane on: out.
			out close ] ]
		ifError: [ :err :rcvr | 
			out
				ifNotNil: [ [ out close.
					tmpFile delete ] ifError: [  ] ].
			saveError := err ].
	workPane
		allMorphsDo: [ :m | 
			(m isKindOf: ScriptableScratchMorph)
				ifTrue: [ m convertTuplesToStacks ] ].
	self addMorph: (workPane position: oldPosition).
	oldScriptsTarget ifNil: [ oldScriptsTarget := workPane ].
	oldScriptsTarget viewBlocksAndScripts.
	scriptsPane tabPane currentTab: oldTab.
	viewerPane currentCategory: oldViewerCategory.
	saveError
		ifNotNil: [ projectName := ''.
			^ self inform: 'Save failed' withDetails: saveError ].
	justSaved := true.
	self updateProjectName.
	projectDirectory / projectName deleteIfAbsent: [  ].
	[ tmpFile renameTo: projectName ]
		ifError: [ ^ self
				inform: 'Save failed'
				withDetails: 'Is the folder read-only?' localized ]