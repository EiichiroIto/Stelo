object i/o
storeFieldsOn: anObjStream

	| oldBlockBinOwner |
	super storeFieldsOn: anObjStream.
	(blocksBin isKindOf: Morph) ifTrue: [
		oldBlockBinOwner := blocksBin owner.
		blocksBin delete].

	self storeFieldsNamed: #(
		objName
		blocksBin
		breed
	) on: anObjStream.

	oldBlockBinOwner ifNotNil: [oldBlockBinOwner addMorph: blocksBin].
