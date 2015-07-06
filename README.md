# Google Fonts loader

Use [Google Fonts](https://www.google.com/fonts) in your [Framer.js][framer]
prototypes.

## Usage
```shell
$ cd <myProject>.framer
$ npm install --save framer-googlefonts
```

modules/myModule.coffee:
```coffeescript
exports.GoogleFonts = require "framer-googlefonts"
```

app.coffee:
```coffeescript
{GoogleFonts} = require "myModule"

new GoogleFonts "Roboto"

Utils.labelLayer new Layer().center(), "Hello, World!",
  fontFamily: "Roboto"
  fontSize: "16px"
```

## API


### `GoogleFonts#load <mixed>`
This can take just about anything you throw at it. You can also load fonts by
passing arguments to the constructor.

```coffeescript
gf = new GoogleFonts "Roboto"

gf.load "Droid Sans", 400, 700
gf.load font: "Roboto", weights: "500italic"
gf.load [
  { font: "Roboto Slab", weights: "400, 500" }
  { font: "Roboto Condensed" }
]
```

### Events
Supports all the [Web Font Loader events][events].

* `loading` - This event is triggered when all fonts have been requested.
* `active` - This event is triggered when the fonts have rendered.
* `inactive` - This event is triggered when the browser does not support linked fonts *or* if none of the fonts could be loaded.
* `fontloading` - This event is triggered once for each font that's loaded.
* `fontactive` - This event is triggered once for each font that renders.
* `fontinactive` - This event is triggered if the font can't be loaded.

[framer]: http://framerjs.com/
[events]: https://github.com/typekit/webfontloader#events
