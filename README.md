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
exports.googleFonts = require "framer-googlefonts"
```

app.coffee:
```coffeescript
{googleFonts} = require "myModule"

googleFonts "Roboto"

Utils.labelLayer new Layer().center(), "Hello, World!",
  fontFamily: "Roboto"
  fontSize: "16px"
```

## API

This can take just about anything you throw at it:

```coffeescript
googleFonts "Roboto"
googleFonts "Roboto", 400, "500"
googleFonts font: "Roboto", weights: 500
googleFonts [
  { font: "Roboto", weights: [500] }
  { font: "Roboto Slab", weights: "400, 500" }
  { font: "Roboto Condensed" }
]
```

[framer]: http://framerjs.com/
