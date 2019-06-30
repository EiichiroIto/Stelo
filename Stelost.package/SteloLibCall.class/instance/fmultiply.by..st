test
fmultiply: anArray by: x
	| size arr |
	size := anArray size.
	^ [ arr := FFIExternalArray externalNewType: 'double' size: size.
	1 to: size do: [ :i | arr at: i put: (anArray at: i) ].
	self fmultiply: arr size: size by: x.
	1 to: size do: [ :i | anArray at: i put: (arr at: i) ] ]
		ensure: [ arr free ].