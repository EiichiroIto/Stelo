initialization
initialize
	"ScratchCodeGenerator initialize."
	OperatorDict := Dictionary new.
	OperatorDict at: #+ put: 'plus'.
	OperatorDict at: #- put: 'minus'.
	OperatorDict at: #* put: 'mul'.
	OperatorDict at: #/ put: 'div'.
	OperatorDict at: #< put: 'less'.
	OperatorDict at: #= put: 'equal'.
	OperatorDict at: #> put: 'more'.
	OperatorDict at: #& put: 'and'.
	OperatorDict at: #| put: 'or'.
	OperatorDict at: #\\ put: 'mod'.