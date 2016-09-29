basename = require('path').basename
openExternal = require('shell').openExternal
platform = require('process').platform
grammarMap = require('./grammar-map')
filenameMap = require('./filename-map')

plugin = module.exports =
  # Use an empty config by default since Atom fails to populate the settings
  # view correctly with pre-defined properties.
  config:
    grammars:
      type: 'object'
      properties: {}
    filenames:
      type: 'object'
      properties: {}

  # Override `openExternal` for testing.
  openExternal: openExternal

  activate: () ->
    atom.commands.add('atom-text-editor', {
      'dash:shortcut': () => @shortcut(true, false),
      'dash:shortcut-background': () => @shortcut(true, true),
      'dash:shortcut-alt': () => @shortcut(false, false),
      'dash:shortcut-alt-background': () => @shortcut(false, true),
      'dash:context-menu': () => @shortcut(true, false)
    })

  shortcut: (sensitive, background) ->
    editor = atom.workspace.getActiveTextEditor()

    return if !editor

    selection = editor.getLastSelection().getText()

    callback = (error) =>
      atom.notifications.addError('Unable to launch Dash', {
        dismissable: true,
        detail: error.message
      }) if error

    if selection
      return plugin.search(selection, sensitive, background, callback)

    return plugin.search(editor.getWordUnderCursor(), sensitive, background, callback)

  search: (string, sensitive, background, cb) ->
    activeEditor = atom.workspace.getActiveTextEditor()

    if sensitive and activeEditor
      path = activeEditor.getPath()
      language = activeEditor.getGrammar().name

    @openExternal(@getDashURI(string, path, language, background), activate: false)

  getKeywordString: (path, language) ->
    keys = []

    if path
      filename = basename(path).toLowerCase()
      filenameConfig = atom.config.get('dash.filenames') || {}
      keys = keys.concat(filenameConfig[filename] || filenameMap[filename] || [])

    if language
      grammarConfig = atom.config.get('dash.grammars') || {}
      keys = keys.concat(grammarConfig[language] || grammarMap[language] || [])

    return keys.map(encodeURIComponent).join(',') if keys.length

  getDashScheme: () ->
    if platform == 'linux'
      return 'dash-plugin:'

    return 'dash-plugin://'

  getDashURI: (string, path, language, background) ->
    scheme = @getDashScheme()
    keywords = @getKeywordString(path, language)
    link = scheme + 'query=' + encodeURIComponent(string)

    if keywords
      link += '&keys=' + keywords

    if background
      link += '&prevent_activation=true'

    return link
