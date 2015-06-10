# Atom Dash

[![Build status][travis-image]][travis-url]

Simple [Dash](http://kapeli.com/dash) documentation integration for [Atom](https://atom.io/packages/dash).

## Installation

```
apm install dash
```

Alternatively open `Preferences -> Packages` and search for `dash`.

## Usage

Look up the word under the current cursor or any selected text by pressing `ctrl-h`. By default, this will cause a syntax sensitive search (E.g. it'll search based on the current file type). If you want to search all documentation, press `ctrl-alt-h`.

### Adding additional docsets

Open the Atom config file `Atom -> Open Your Config` and add the docsets under the `dash` object in the following form:

```cson
'dash':
  'grammars':
    'JavaScript': [
      'nodejs'
    ]
  'filenames':
    'gruntfile.js': [
      'grunt'
    ]
```

**Please note:** File names _must_ be lower case.

Docsets defined in your local configuration will override the default settings. Take a look at the [built-in grammar map](https://github.com/blakeembrey/atom-dash/blob/master/lib/grammar-map.coffee) and [built-in filename map](https://github.com/blakeembrey/atom-dash/blob/master/lib/filename-map.coffee) for the default configurations.

## License

MIT

[travis-image]: https://img.shields.io/travis/blakeembrey/atom-dash.svg?style=flat
[travis-url]: https://travis-ci.org/blakeembrey/atom-dash
