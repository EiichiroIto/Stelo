test
testGetFloatAllBreed
	| w t arr |
	w := SPluginWorld new.
	t := STurtles new breedNo: 3.
	t create: 5.
	Transcript show: (SteloLibCall new getErrorMessage); cr.
	w setupBreed: t.
	Transcript show: (SteloLibCall new getErrorMessage); cr.
	"w plugin createTurtleSize: 5 breedId: 3."
	w var: STurtleVarId xVarNo breed: 3 at: 1 put: 10.0.
	Transcript show: (SteloLibCall new getErrorMessage); cr.
	w var: STurtleVarId xVarNo breed: 3 at: 2 put: 20.0.
	"(w plugin getFloatAll: 3 breed: 3) inspect."
	arr := w getFloatAll: STurtleVarId xVarNo breed: 3.
	self assert: arr size equals: 100.
	self assert: arr first closeTo: 10.
	self assert: arr second closeTo: 20.
	self assert: arr third closeTo: 0.
	Transcript show: (SteloLibCall new getErrorMessage); cr.
	Transcript show: (SteloLibCall new sizeOf: 3); cr.
	Transcript show: (SteloLibCall new countAliveOf: 3); cr.