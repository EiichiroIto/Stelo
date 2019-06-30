private
indexAtRow: r col: c
	| i |
	i := (c - 1) * order + r.
	^ ((i - 1) \\ self count) + 1