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
#   font: "Roboto", weights: [500]
#   font: "Roboto Slab", weights: "400, 500"
#   font: "Roboto Condensed"
# ]
#

googleFonts = ->
	families = []
	weights
	
	if typeof arguments[0] is "string"
		weights = Array::slice.call(arguments, 1).join()
		families.push "#{arguments[0]}:#{weights}:latin"
	else
		(if Array.isArray arguments[0] then arguments[0] else [arguments[0]])
	    	.forEach (family) ->
				weights = family.weights or []
				families.push family.font + ":" + weights + ":latin"

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

# Test
googleFonts "Roboto"

new Layer(
	html: "hello world", color: "black", backgroundColor: "transparent"
	style: fontFamily: "Roboto"
).center()