private
pointOf: aPoint
	| p |
	p := (aPoint - offset) // cell - (modelExtent // 2).
	^ p x @ p y negated