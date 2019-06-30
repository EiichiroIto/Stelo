accessing
delete: aString
	| id |
	(self includes: aString)
		ifFalse: [ ^ self ].
	id := self varNoFor: aString.
	id <= self class reservedNo
		ifTrue: [ ^ self error ].
	varNames remove: aString.