world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #Stelo)
		order: 0.5;
		target: self;
		action: [self open]; 
		icon: self icon.