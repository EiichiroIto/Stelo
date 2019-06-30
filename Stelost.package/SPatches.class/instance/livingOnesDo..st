enumerating
livingOnesDo: aBlock
	1 to: self count do: [ :each | aBlock value: each ].