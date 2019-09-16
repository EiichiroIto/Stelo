basic ops
turtlesCount: bno
	^ bcGenerator
		getObserverVar: SObserverVarId countAliveVarNo
		arg: (bno argString: parser)