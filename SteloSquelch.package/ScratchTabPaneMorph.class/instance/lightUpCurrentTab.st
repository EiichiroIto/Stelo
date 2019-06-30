private
lightUpCurrentTab

	(self submorphs) do: [:m |
		(m isKindOf: ResizableToggleButton2) ifTrue: [
			m arguments first = currentTab
				ifTrue: [m setLabelColor: ScratchFrameMorph labelOnColor; on; comeToFront]
				ifFalse: [m setLabelColor: ScratchFrameMorph labelOffColor; off]]].
