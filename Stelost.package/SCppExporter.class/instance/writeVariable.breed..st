private
writeVariable: aString breed: bid
	stream
		nextPutAll: '  world->addVariable(';
		nextPutAll: bid asString;
		nextPutAll: ', "';
		nextPutAll: aString;
		nextPutAll: '");';
		nextPutAll: String lf