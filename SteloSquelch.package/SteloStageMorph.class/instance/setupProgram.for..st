scratch processes/events
setupProgram: aProgram for: aMorph
	| subTable |
	subTable := Dictionary new.
	aMorph subBlocks
		do: [ :each | 
			self
				setupSub: each
				program: aProgram
				for: aMorph
				table: subTable ].
	aMorph eventBlocks
		do: [ :each | 
			self
				setupEvent: each
				program: aProgram
				for: aMorph
				table: subTable ].