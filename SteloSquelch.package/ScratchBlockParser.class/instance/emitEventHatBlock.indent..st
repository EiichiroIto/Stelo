code generator
emitEventHatBlock: aMorph indent: indent
	| str |
	str := aMorph eventName.
	str isEmpty ifTrue: [^ self].
	codeGenerator generateSubroutineHeader: str.
	aMorph nextBlock
		ifNotNil: [self
				emitCode: aMorph nextBlock
				indent: indent + (codeGenerator indentLevelFor: str)].