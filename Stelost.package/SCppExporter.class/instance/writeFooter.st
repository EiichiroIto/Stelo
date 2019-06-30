private
writeFooter
	stream
		nextPutAll: '  return program;';
		nextPutAll: String lf;
		nextPutAll: '}';
		nextPutAll: String lf.