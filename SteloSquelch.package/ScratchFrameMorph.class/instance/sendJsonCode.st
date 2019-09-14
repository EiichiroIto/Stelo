stelo
sendJsonCode
	| addr json |
	addr := StringDialog
		ask: 'Enter Stelo Server Address.'
		initialAnswer: (serverAddress ifNil: [ '' ]).
	addr isEmpty
		ifTrue: [ ^ self ].
	serverAddress := addr.
	json := SJsonExporter new exportFrom: workPane.
	ZnEasy post: 'http://' , addr data: (ZnEntity text: json)