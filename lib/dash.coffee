basename = require('path').basename
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

  search: (string, sensitive, cb) ->
    activeEditor = atom.workspace.getActiveTextEditor()

    if sensitive and activeEditor
      path = activeEditor.getPath()
      language = activeEditor.getGrammar().name

    cmd = @getCommand(string, path, language)

    # Exec is used because spawn escapes arguments that contain double-quotes
    # and replaces them with backslashes. This interferes with the ability to
    # properly create the child process in windows, since windows will barf
    # on an ampersand that is not contained in double-quotes.
    return exec(cmd, cb)

  getCommand: (string, path, language) ->
    if platform == 'win32'
      return 'cmd.exe /c start "" "' + @getDashURI(string, path, language) + '"'

    if platform == 'linux'
      return @getZealCommand(string, path, language)

    return 'open -g "' + @getDashURI(string, path, language) + '"'

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

  getDashURI: (string, path, language) ->
    link = 'dash-plugin://query=' + encodeURIComponent(string)
    keywords = @getKeywordString(path, language)

    if keywords
      link += '&keys=' + keywords

    return link

  getZealCommand: (string, path, language) ->
    query = string
    keywords = @getKeywordString(path, language)

    if keywords
      query = keywords + ':' + query

    return 'zeal --query "' + query + '"'
