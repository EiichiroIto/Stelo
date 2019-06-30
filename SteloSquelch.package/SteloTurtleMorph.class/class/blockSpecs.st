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
			('forward %n'		- forward: 5)
			('turn %n'				- turn: 15)
			('heading %n'		- setHeading: 0)
			-
			('change x by %n'		-	changeXposBy: 5)
			('set x to %n'				-	setXpos: 0)
			('change y by %n'		-	changeYposBy: 5)
			('set y to %n'				-	setYpos: 0)
			-
			('hatch'					-	hatch)
			('die'						- die)
		'pen'
			('stamp'				- stamp)
			('pen up'				- penUp)
			('pen down'			- penDown)
			('is pen down?'	r isPenDown)
		'sensing'
			('id'					r	getId)
			('x position'		r	getXpos)
			('y position'		r	getYpos)
			('heading'			r	getHeading)
			('dx'					r	dx)
			('dy'					r	dy)
			('breed id'			r	getBreedId)
			-
			('distance to x %n y %n'	r	distanceToX:y: 0 0)
			('direction to x %n y %n'	r	directionToX:y: 0 0)
			('one of %m at x %n y %n'	r	turtle:x:y: '')
			('aim high %p'			r	aimHigh: '')
			-
			('%n of %m ''s %t'	r	getTurtleVar:breed:id:		0 '' '')
		'control'
			('when setup'		S	-)
			('break'				-	break)
		'patch'
			('patch color at x %n y %n' 			r 	getPatchColorX:y: 0 0)
			('set patch color at x %n y %n to %c'			- setPatchColorX:y:to: 0 0 15)
			-
			('patch''s %p at x %n y %n'							r 	getPatchVar:x:y: 	'' 0 0)
			('set patch''s %p at x %n y %n to %n'			-	setPatchVar:x:y:to: '' 0 0 0)
			('change patch''s %p at x %n y %n by %n'		-	changePatchVar:x:y:by: '' 0 0 1)
	).

	^ blocks, self colorBlocks, super blockSpecs