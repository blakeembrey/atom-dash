basename = require('path').basename
spawn = require('child_process').spawn
grammarMap = require('./grammar-map')
filenameMap = require('./filename-map')

plugin = module.exports =
  # Use an empty config by default since Atom fails to populate the settings
  # view corretly with pre-defined properties.
  config:
    grammars:
      type: 'object'
      properties: {}
    filenames:
      type: 'object'
      properties: {}

  activate: () ->
    atom.commands.add('atom-text-editor', {
      'dash:shortcut': () => @shortcut(true),
      'dash:shortcut-alt': () => @shortcut(false),
      'dash:context-menu': () => @contextMenu()
    })

  shortcut: (sensitive) ->
    editor = atom.workspace.getActiveTextEditor()

    return if !editor

    selection = editor.getLastSelection().getText()

    return plugin.search(selection, sensitive) if selection

    scopes = editor.getLastCursor().getScopeDescriptor().getScopesArray()
    currentScope = scopes[scopes.length - 1]

    # Use the current cursor scope if available. If the current scope is a
    # string, comment or not available, get the current word under the cursor.
    # Ignore: comment (any), string (any), meta (html), markup (md).
    if scopes.length > 1 && !/^(?:comment|string|meta|markup)(?:\.|$)/.test(currentScope)
      range = editor.bufferRangeForScopeAtCursor(currentScope)
      text = editor.getTextInBufferRange(range)
    else
      text = editor.getWordUnderCursor()
      # Make search inside comments non-sensitive.
      sensitive = false

    plugin.search(text, sensitive)

  contextMenu: () ->
    plugin.search(atom.workspace.getActiveTextEditor().getWordUnderCursor(), true)

  search: (string, sensitive) ->
    activeEditor = atom.workspace.getActiveTextEditor()

    if sensitive and activeEditor
      path = activeEditor.getPath()
      language = activeEditor.getGrammar().name

    spawn('open', ['-g', @createLink(string, path, language)])

  createLink: (string, path, language) ->
    keys = []

    if path
      filename = basename(path).toLowerCase()
      filenameConfig = atom.config.get('dash.filenames') || {}
      keys = keys.concat(filenameConfig[filename] || filenameMap[filename] || [])

    if language
      grammarConfig = atom.config.get('dash.grammars') || {}
      keys = keys.concat(grammarConfig[language] || grammarMap[language] || [])

    link = 'dash-plugin://'

    if keys.length
      link += 'keys=' + keys.map(encodeURIComponent).join(',') + '&'

    link += 'query=' + encodeURIComponent(string)
