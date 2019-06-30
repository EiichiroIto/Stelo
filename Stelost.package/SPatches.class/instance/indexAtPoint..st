private
indexAtPoint: aPoint
	| r c |
	r := aPoint x floor + (order // 2) + 1.
	c := aPoint y floor + (order // 2) + 1.
	^ self indexAtRow: r col: c