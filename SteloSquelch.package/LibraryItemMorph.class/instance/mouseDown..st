event handling
mouseDown: evt
	"Handle a mouse click. Left click either sets me as a target, deletes me, or copies me.  Shift left click makes me reappear in the middle of the screen.  Holding left button drags me. Right button brings up a menu."

	| duplicate frame |
	target ifNotNil: [
		evt yellowButtonPressed
			ifTrue: [
				Sensor waitNoButton. 
				(target breedNo > SBreedId patchBreedNo) 
					ifTrue: [^ self rightButtonMenu]]
			ifFalse:	[
				self select.
				frame := self meOrOwnerThatIsA: ScratchFrameMorph.
				"Set the viewerPane target to my target so I stay highlighted while I am being dragged. This is sort of a hack because my target is not actually being viewed until the mouseUp: command is called."
				frame viewerPane target: self target.
				evt hand waitForClicksOrDrag: self event: evt]].
