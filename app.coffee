#
# Google Fonts loader
#
# @param {...string} varParams
#
# All the following params are valid:
#
# googleFonts "Roboto"
# googleFonts "Roboto", 400, "500"
# googleFonts font: "Roboto", weights: 500
# googleFonts [
# 	font: "Roboto", weights: [500]
# 	font: "Roboto Slab", weights: "400, 500"
# 	font: "Roboto Condensed"
# ]
#

googleFonts = (args...) ->
	firstArg = args[0]
	families = []
	weights
	
	if typeof firstArg is "string"
		weights = args[1..].join()
		families.push "#{firstArg}:#{weights}:latin"
	else
		(if Array.isArray firstArg then firstArg else [firstArg])
			.forEach (family) ->
				weights = family.weights or []
				families.push "#{family.font}:#{weights}:latin"

	window.WebFontConfig = google: families: families
	wf = document.createElement "script"
	wf.src = (if "https:" is document.location.protocol then "https" else "http") +
		"://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js"
	wf.type = "text/javascript"
	wf.async = "true"
	s = document.getElementsByTagName("script")[0]
	s.parentNode.insertBefore wf, s
	return

module?.exports = googleFonts
