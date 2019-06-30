drawing
stageShotSized: size
	"Answer a thumbnail of me and my submorphs. Use super fullDrawOn: to avoid drawing the shadows along the top and left edges of the workspace."

	| canvas thumbForm |
	canvas := FormCanvas extent: bounds extent depth: 32.
	canvas translateBy: bounds topLeft negated during: [ :c | super fullDrawOn: c ].
	thumbForm := Form extent: size depth: 32.
	(WarpBlt toForm: thumbForm)
		sourceForm: canvas form;
		cellSize: 2;
		combinationRule: Form over;
		copyQuad: (0 @ 0 extent: canvas extent) innerCorners toRect: thumbForm boundingBox.
	"thumbForm := thumbForm colorReduced.
	thumbForm depth > 8
		ifTrue: [ thumbForm := thumbForm asFormOfDepth: 8 ]."
	^ thumbForm.