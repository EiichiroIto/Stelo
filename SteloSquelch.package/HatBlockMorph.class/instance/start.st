processes
start
	| stage |
	self stop.
	scriptOwner ifNil: [ ^ self ].
	(stage := self receiver meOrOwnerThatIsA: SteloStageMorph) ifNil: [ ^ self ].
	stage startProcessFor: self.
	self changed.