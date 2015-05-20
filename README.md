# Google Fonts loader

Use [Google Fonts](https://www.google.com/fonts) in your prototypes.

## Usage
```shell
$ framer myProject &
$ cd myProject
$ npm install --save peteschaffner/framer-googlefonts
```

index.js:
```javascript
var googleFonts = require('framer-googlefonts')

googleFonts('Pacifico')

Utils.labelLayer(new Layer().center(), 'Hello World', {
  fontFamily: 'Pacifico',
  fontSize: '16px'
})
```

## API

This can take just about anything you throw at it:

```javascript
googleFonts('Roboto')
googleFonts('Roboto', 400, '500')
googleFonts({ font: 'Roboto', weights: 500 })
googleFonts([
  { font: 'Roboto', weights: [500] },
  { font: 'Roboto Slab', weights: '400, 500' },
  { font: 'Roboto Condensed' }
])
```
