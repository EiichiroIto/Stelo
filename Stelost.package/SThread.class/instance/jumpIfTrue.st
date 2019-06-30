control ops
jumpIfTrue
	| address cond |
	address := self pop.
	cond := self pop.
	cond
		ifTrue: [ pc := address ].