tests-private
testPrivEvents
	| e d |
	e := SExporter new.
	self assert: e privEvents isNil.
	d := Dictionary new.
	e privEvents: d.
	self assert: e privEvents equals: d.
	