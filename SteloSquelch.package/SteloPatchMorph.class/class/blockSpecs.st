block specs
blockSpecs
	"Answer a collection of block specifications for the blocks that are common to all objects. Block specificatons (Arrays) are interspersed with category names (Strings). A block specification is an Array of the form: (<block spec string> <block type> <selector> [optional initial argument values]).

	Explanation of flags:
		-	no flags
		b	boolean reporter
		c	c-shaped block containing a sequence of commands (always special form)
		r	reporter
		s	special form command with its own evaluation rule
		t	timed command, like wait or glide
		E	message event hat
		K	key event hat
		M	mouse-click event hat
		S	start event hat
		W	when <condition> hat (obsolete)"

	| blocks |
	blocks := #(
		'basic'
			('kill %n of %m'					-	kill:breed:)
		'sensing'
			('id'									r	getId)
			('x position'						r	getXpos)
			('y position'						r	getYpos)
			('one of %m at x %n y %n'				r	turtle:x:y: '')
			('distance to x %n y %n'	r	distanceToX:y: 0 0)
			('direction to x %n y %n'	r	directionToX:y: 0 0)
		'control'
			('when setup'						S	-)
		'patch'
			('patch color at x %n y %n' 			r 	getPatchColorX:y: 0 0)
			('set patch color at x %n y %n to %c'			- setPatchColorX:y:to: 0 0 15)
	).

	^ blocks, self colorBlocks, super blockSpecs