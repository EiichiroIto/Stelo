private
labelArrayFor: aCollection
	| addr array |
	addr := 1.
	array := Array new: labelId size.
	aCollection
		do: [ :each | 
			each isLabel
				ifTrue: [ array at: each id put: addr ].
			addr := addr + each codeSize ].
	^ array