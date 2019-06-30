private
setupTurtleAt: index
	self colorAt: index put: self defaultColor.
	self aliveAt: index put: true.
	self xAt: index put: 0.
	self yAt: index put: 0.
	self headingAt: index put: 360 atRandom - 1.0.
	self penDownAt: index put: false