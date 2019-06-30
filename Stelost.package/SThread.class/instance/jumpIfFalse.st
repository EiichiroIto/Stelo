control ops
jumpIfFalse
	| address cond |
	address := self pop.
	cond := self pop.
	cond
		ifFalse: [ pc := address ].