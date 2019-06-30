private
getLocalDirectoryNames
	"Answer the directories in currentDir. Suppress hidden volumes."

	| dirNames visible |
	dirNames := currentDir directoryNames.
	(visible := ScratchFrameMorph visibleDrives) ifNil: [ ^ dirNames ].
	Smalltalk os isMacOSX
		ifTrue: [ currentDir path = '/Volumes'
				ifFalse: [ ^ dirNames ] ]
		ifFalse: [ currentDir path = ''
				ifFalse: [ ^ dirNames ] ].
	^ dirNames select: [ :dir | visible includes: dir asUppercase ].