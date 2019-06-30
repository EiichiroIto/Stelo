accessing
code
	| firstPass labelArray out |
	firstPass := stream contents.
	labelArray := self labelArrayFor: firstPass.
	self resolveJumpAddress: firstPass using: labelArray.
	out := WriteStream on: Array new.
	firstPass do: [ :each | each putOn: out ].
	^ out contents