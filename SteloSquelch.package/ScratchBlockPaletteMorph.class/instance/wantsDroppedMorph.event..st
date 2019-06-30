dropping/grabbing
wantsDroppedMorph: aMorph event: evt

	| f |
	((aMorph isKindOf: BlockMorph) or:
	 [(aMorph isKindOf: LibraryItemMorph) or:
	 [aMorph isKindOf: ScratchCommentMorph]])
		ifTrue: [^ true].

	((aMorph isKindOf: SteloTurtleMorph) or: [ aMorph isKindOf: SteloPatchMorph ]) ifTrue: [
		f := self meOrOwnerThatIsA: ScratchFrameMorph.
		f viewerPane pageViewer contents = self ifTrue: [^ true]].

	^ false
