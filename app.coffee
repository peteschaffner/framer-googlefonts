
class GoogleFonts extends Framer.BaseClass
	constructor: (args...) ->
		Utils.domLoadScriptSync "//ajax.googleapis.com/ajax/libs/webfont/1/webfont.js"
			
		@load.apply @, args if args.length

	load: (args...) ->
		firstArg = args[0]
		families = []
		
		# create WebFontConfig string
		if typeof firstArg is "string"
			weights = args[1..].join()
			families.push "#{firstArg}:#{weights}:latin"
		else
			(if Array.isArray firstArg then firstArg else [firstArg])
				.forEach (family) ->
					weights = family.weights or []
					families.push "#{family.font}:#{weights}:latin"

		window.WebFont.load 
			google: families: families
			classes: false
			# Font loading events
			# https://github.com/typekit/webfontloader#events
			loading: => @emit "loading"
			active: => @emit "active"
			inactive: => @emit "inactive"
			fontloading: (familyName, fvd) =>
				@emit "fontloading", familyName, fvd
			fontactive: (familyName, fvd) =>
				@emit "fontactive", familyName, fvd
			fontinactive: (familyName, fvd) =>
				@emit "fontinactive", familyName, fvd

module?.exports = GoogleFonts
