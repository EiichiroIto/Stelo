private
writeHeader
	stream
		nextPutAll: 'SProgram *makeProgram(SMicroWorld *world)';
		nextPutAll: String lf;
		nextPutAll: '{';
		nextPutAll: String lf;
		nextPutAll: '  SProgram *program = new SProgram;';
		nextPutAll: String lf.