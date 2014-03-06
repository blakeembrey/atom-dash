# Dash

Simple [dash](http://kapeli.com/dash) documentation integration for [Atom](https://atom.io/packages/dash).

## Installation

```sh
apm install dash
```

## Usage

Look up the word under the current cursor or any selected text by pressing `ctrl-h`. By default, this will cause a syntax sensitive search (E.g. it'll search based on the current file type). If you want to search all documentation, press `ctrl-alt-h`.

### Adding additional docsets

Open the Atom config file `Atom -> Open Your Config` and add the docsets to the `dash.grammars` object in the form of `language: [docset, docset]`. For example:

```cson
'dash':
  'grammars':
    'JavaScript': [
      'nodejs'
    ]
```

## License

MIT
