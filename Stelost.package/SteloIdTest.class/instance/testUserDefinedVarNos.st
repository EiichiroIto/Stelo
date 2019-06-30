tests-accessing
testUserDefinedVarNos
	| e |
	e := SteloId new.
	self assertCollection: e userDefinedVarNos equals: #().
	e newNo.
	self assertCollection: e userDefinedVarNos equals: #(1).
	e newNo.
	self assertCollection: e userDefinedVarNos equals: #(1 2).