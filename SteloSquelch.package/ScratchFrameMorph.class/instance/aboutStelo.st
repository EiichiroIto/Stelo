menu/button actions
aboutStelo

	| dialogBox |
	dialogBox := DialogBoxMorph new
		title: 'About Stelo';
		withButtonsForYes: false no: false okay: true cancel: false.
	dialogBox
		message: 'Stelo
Copyright © 2018 Eiichiro Ito (ghc02331@nifty.com)
All rights reserved.

Based on Scratch from the MIT Media Lab, v', Version, '
Copyright © 2009 Massachusetts Institute of Technology.
All rights reserved.
'
		font: (ScratchFrameMorph getFont: #AboutScratch).

	dialogBox getUserResponse.
