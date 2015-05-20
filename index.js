

/**
 * Google Fonts loader
 *
 * @param {...string} varParams
 *
 * All the following params are valid:
 *
 * googleFonts('Roboto')
 * googleFonts('Roboto', 400, '500')
 * googleFonts({ font: 'Roboto', weights: 500 })
 * googleFonts([
 *   { font: 'Roboto', weights: [500] },
 *   { font: 'Roboto Slab', weights: '400, 500' },
 *   { font: 'Roboto Condensed' }
 * ])
 */

module.exports = function() {
  var families = []
  var weights

  if (typeof arguments[0] == 'string') {
    weights = Array.prototype.slice.call(arguments, 1).join()
    families.push(`${arguments[0]}:${weights}:latin`)
  } else {
    for (let family of Array.isArray(arguments[0]) ? arguments[0] : arguments) {
      weights = family.weights || []
      families.push(`${family.font}:${weights}:latin`)
    }
  }

  window.WebFontConfig = {
    google: { families: families }
  };

  var wf = document.createElement('script');
  wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
    '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
  wf.type = 'text/javascript';
  wf.async = 'true';
  var s = document.getElementsByTagName('script')[0];
  s.parentNode.insertBefore(wf, s);
}
