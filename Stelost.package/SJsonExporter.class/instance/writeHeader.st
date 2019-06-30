private
writeHeader
	stream
		nextPutAll: '{"title":"';
		nextPutAll: title;
		nextPutAll: '","breeds":['.