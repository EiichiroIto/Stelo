other
startProcess: aProcess
	| stage |
	self hasRunningProcess ifTrue: [^ nil].
	scriptOwner ifNil: [^ nil].
	(stage := scriptOwner meOrOwnerThatIsA: SteloStageMorph) ifNil: [^ nil].
	scratchProc := aProcess.
	self changed.
	^ scratchProc