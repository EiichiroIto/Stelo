tests-private
testEventIdFor
	| e d |
	e := SExporter new.
	d := Dictionary new.
	d at: #a put: 1.
	d at: #b put: 2.
	e privEvents: d.
	self assert: (e eventIdFor: #a) equals: 1.
	self assert: (e eventIdFor: #b) equals: 2.