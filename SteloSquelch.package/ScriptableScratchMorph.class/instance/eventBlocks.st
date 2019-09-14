private
eventBlocks
	^ blocksBin submorphs select: [:m | m isKindOf: EventHatMorph]