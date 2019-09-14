private
startLoop: anInteger
	stepTime := anInteger.
	self stopAll.
	workPane runLoop.
	self world displayWorldSafely.
	(Delay forMilliseconds: 20) wait