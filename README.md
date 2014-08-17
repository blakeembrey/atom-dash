# Atom Dash

[![Build status][travis-image]][travis-url]
[![Gittip][gittip-image]][gittip-url]

Simple [Dash](http://kapeli.com/dash) documentation integration for [Atom](https://atom.io/packages/dash).

## Installation

```sh
apm install dash
```

Alternatively open `Preferences -> Packages` and search for `dash`.

## Usage

Look up the word under the current cursor or any selected text by pressing `ctrl-h`. By default, this will cause a syntax sensitive search (E.g. it'll search based on the current file type). If you want to search all documentation, press `ctrl-alt-h`.

### Adding additional docsets

Open the Atom config file `Atom -> Open Your Config` and add the docsets under `dash.grammars` object in the form of `language: [docset, docset]`. For example:

```cson
'dash':
  'grammars':
    'JavaScript': [
      'nodejs'
    ]
```

Docsets defined in your local configuration will override the default settings. Take a look at the [built-in map file](https://github.com/blakeembrey/atom-dash/blob/master/lib/map.coffee) for the default docset configuration.

## License

MIT

[travis-image]: https://img.shields.io/travis/blakeembrey/atom-dash.svg?style=flat
[travis-url]: https://travis-ci.org/blakeembrey/atom-dash
[gittip-image]: https://img.shields.io/gittip/blakeembrey.svg?style=flat
[gittip-url]: https://www.gittip.com/blakeembrey
