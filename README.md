# Atom Dash

[![Build status][travis-image]][travis-url]

> Simple [Dash](http://kapeli.com/dash) documentation integration for [Atom](https://atom.io/packages/dash).

**Please note:** This plugin will also work with Velocity on Windows and Zeal on Linux.

## Installation

```
apm install dash
```

Alternatively, open `Settings/Preferences -> Install` and search for `dash`.

## Usage

Look up the word under your cursor or selected text by pressing `ctrl-h`. This uses a scoped search and searches based on the current file name and selected syntax. If you want to search all documentation, press `ctrl-alt-h`.

**Hint:** To open avoid activating Dash, add `shift` to the command. E.g. `ctrl-shift-h`. This is useful when Dash is already visible - such as a dual monitor setup.

### Adding Docsets

Open the Atom config file `Atom -> Config...` and add the docsets under the `dash` object in the following form:

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
