private
importSprites: aCollection
	| morph |
	aCollection
		do: [ :each | 
			each first = 'for'
				ifTrue: [ morph := workPane findObjName: each second.
					each third do: [ :v | morph addVariable: v ].
					self importScripts: each fourth for: morph ] ]