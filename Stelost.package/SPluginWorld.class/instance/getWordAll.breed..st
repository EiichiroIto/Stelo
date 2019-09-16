private
getWordAll: vno breed: bno
	| size ptr barr arr i |
	size := self sizeOf: bno.
	arr := WordArray new: size withAll: 0.
	ptr := plugin getWordAll: vno breed: bno.
	ptr isNull
		ifTrue: [ ^ nil ].
	[ i := 1.
	barr := ptr copyFrom: 1 to: size * 4.
	1 to: size do: [ :each | 
		arr at: each put: (barr unsignedLongAt: i).
		i := i + 4 ] ]
		ensure: [ ptr autoRelease ].
	^ arr