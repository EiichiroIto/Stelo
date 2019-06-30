private
setPatchColor: anInteger at: aPoint
	| ps |
	ps := microworld patches.
	ps colorAtPoint: aPoint put: anInteger.
	steloDisplay changed.