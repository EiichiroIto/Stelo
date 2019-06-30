processes
start

	| stage |
	self stop.
	self receiver ifNil: [^ self].
	(stage := self receiver meOrOwnerThatIsA: SteloStageMorph) ifNil: [^ self].
	stage startProcessFor: self.
	self changed.
