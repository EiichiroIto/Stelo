private
importEvent: aCollection for: aMorph eventName: aString
	| block prev tuple |
	prev := aMorph frameMorph scriptsPane scriptsMorph.
	tuple := self eventBlockTupleFor: aString.
	block := aMorph hatBlockFromTuple: tuple receiver: aMorph.
	prev addMorph: block.
	prev := block.
	aCollection
		do: [ :each | 
			tuple := self tupleFrom: each.
			block := aMorph blockFromTuple: tuple receiver: aMorph.
			prev nextBlock: block.
			prev := block ]