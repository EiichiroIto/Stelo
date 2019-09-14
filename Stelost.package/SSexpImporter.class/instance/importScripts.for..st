private
importScripts: aCollection for: aMorph
	| frameMorph |
	frameMorph := aMorph frameMorph.
	frameMorph view: aMorph tab: 'Scripts' category: 'basic'.
	aCollection
		do: [ :each | 
			each first = 'when'
				ifTrue: [ self importEvent: each third for: aMorph eventName: each second ].
			each first = 'sub'
				ifTrue: [ self importSub: each third for: aMorph subName: each second ]].
	frameMorph scriptsPane cleanUp