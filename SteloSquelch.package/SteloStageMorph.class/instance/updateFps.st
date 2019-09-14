private
updateFps
	| msec ticks fps info |
	fpsCount := fpsCount + 1.
	fpsCount < self defaultFpsThreshold
		ifTrue: [ ^ self ].
	fpsCount := 0.
	msec := Time millisecondClockValue.
	ticks := sworld ticks.
	lastMSec
		ifNotNil: [ fps := ((ticks - lastTicks) * 1000 / (msec - lastMSec)) truncated.
			info := 'ticks=' , ticks truncated asString , ' (' , fps asString , 'fps)'.
			steloDisplay info: info ].
	lastMSec := msec.
	lastTicks := ticks