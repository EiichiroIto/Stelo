menu/button actions
startSetup
	"Broadcasts the start event to all objects and processes."

	self stopAll.
	workPane runSetup.
	"workPane broadcastEventNamed: 'Scratch-StartClicked' with: 0.
	flagButton on."
	World displayWorldSafely.  "force button flash"
	(Delay forMilliseconds: 20) wait.
