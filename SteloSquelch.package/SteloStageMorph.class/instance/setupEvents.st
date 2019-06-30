private
setupEvents
	| result eventId |
	eventId := SEventId new.
	result := Dictionary new.
	result at: #startup put: SEventId startupEventNo.
	result at: #setup put: SEventId setupEventNo.
	result at: #loop put: SEventId loopEventNo.
	result at: #single put: SEventId singleEventNo.
	self allEventNames do: [ :each | result at: each asSymbol put: eventId newNo ].
	events := result.
	^ events