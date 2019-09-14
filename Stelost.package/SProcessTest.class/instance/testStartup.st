tests-accessing
testStartup
	| w p |
	w := SMicroWorld new.
	w addBreed: (SObserver new sworld: w).
	p := w newProcess program: SProgram new.
	p startup.
	self assert: p privTransition equals: #afterStartup.
	self assertCollection: p privRunningEvents equals: {SEventId startupEventNo}.