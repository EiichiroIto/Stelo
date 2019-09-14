initialization
initialize
	breed := SObserver new.
	super initialize.
	sprites := OrderedCollection new.
	updateDisplay := true.
	lastMSec := nil.
	lastTicks := 0.
	fpsCount := 0.
	self setupDisplay.