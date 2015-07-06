basename = require('path').basename
spawn = require('child_process').spawn
exec = require('child_process').exec
platform = require('process').platform
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
      'dash:context-menu': () => @shortcut(true)
    })

  shortcut: (sensitive) ->
    editor = atom.workspace.getActiveTextEditor()

    return if !editor

    selection = editor.getLastSelection().getText()

    return plugin.search(selection, sensitive) if selection

    scopes = editor.getLastCursor().getScopeDescriptor().getScopesArray()
    currentScope = scopes[scopes.length - 1]

    # Search using the current cursor word when the scope is a string,
    # comment, meta (HTML) or markup (MD), or when there is no active scope.
    if scopes.length < 2 or /^(?:comment|string|meta|markup)(?:\.|$)/.test(currentScope)
      return plugin.search(editor.getWordUnderCursor(), sensitive)

    range = editor.bufferRangeForScopeAtCursor(currentScope)

    # Sometimes the range is unavailable. Fallback to the current word.
    if range?
      text = editor.getTextInBufferRange(range)
    else
      text = editor.getWordUnderCursor()

    plugin.search(text, sensitive)

  search: (string, sensitive) ->
    activeEditor = atom.workspace.getActiveTextEditor()

    if sensitive and activeEditor
      path = activeEditor.getPath()
      language = activeEditor.getGrammar().name

    if platform == 'win32'
      # Exec is used because spawn escapes arguments that contain double-quotes
      # and replaces them with backslashes. This interferes with the ability to
      # properly create the child process in windows, since windows will barf
      # on an ampersand that is not contained in double-quotes.
      quotedLink = '"' + @createLink(string, path, language) + '"'
      exec('cmd.exe /c start "" ' + quotedLink, null)
    #else if platform == 'linux'  ## Zeal is the only linux alternative and it does not support Dash urls at this point
    #  spawn('xdg-open', [@createLink(string, path, language)])
    else  # Darwin (OSX) / FreeBSD
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
