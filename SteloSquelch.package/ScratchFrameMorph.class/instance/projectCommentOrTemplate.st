accessing
projectCommentOrTemplate
	^ projectInfo at: 'comment' ifAbsent: [ '' ]