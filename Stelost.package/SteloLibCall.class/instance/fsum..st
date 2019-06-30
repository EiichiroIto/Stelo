test
fsum: anArray
	| size arr |
	size := anArray size.
	^ [ arr := FFIExternalArray externalNewType: 'double' size: size.
	1 to: size do: [ :i | arr at: i put: (anArray at: i) ].
	self fsum: arr size: size ]
		ensure: [ arr free ].