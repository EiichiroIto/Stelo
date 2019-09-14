stepping and presenter
step
	| ret |
	target ifNil: [ ^ self ].
	selector ifNil: [ ^ self ].
	ret := target perform: selector.
	self contents: ret asString