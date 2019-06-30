stelo
initialExtent
	| world w h |
	world := self currentWorld.
	w := world width.
	h := world height.
	h := h - world menubar height.
	world taskbars do: [ :each | h := h - each height ].
	^ w @ h