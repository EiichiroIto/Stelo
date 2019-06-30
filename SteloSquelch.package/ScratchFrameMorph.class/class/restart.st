stelo
restart
	| m |
	self allInstancesDo: [:each | each delete].
	m := ScratchFrameMorph new.
	m setLanguage: 'en'.
	m position: World topRight - (m width @ 0).
	m startup.
	m newScratchProject.
	m openInWorld.
	m fillScreenOn.
	World doOneCycleNow.
	Smalltalk snapshot: true andQuit: true.
	m startup.
	Sensor useOSEvents: true.