map = require('./map')
spawn = require('child_process').spawn

plugin = module.exports =
  activate: () ->
    atom.commands.add('atom-text-editor', {
      'dash:shortcut': @shortcut,
      'dash:shortcut-alt': @shortcut.bind(@, false),
      'dash:context-menu': @contextMenu
    })

  shortcut: (sensitive) ->
    editor = atom.workspace.getActiveTextEditor()

    return if !editor

    selection = editor.getSelection().getText()

    return plugin.search(selection, sensitive) if selection

    scopes = editor.getCursorScopes()
    currentScope = scopes[scopes.length - 1]

    # Use the current cursor scope if available. If the current scope is a
    # string, comment or not available, get the current word under the cursor.
    # Ignore: comment (any), string (any), meta (html), markup (md).
    if scopes.length > 1 && !/^(?:comment|string|meta|markup)(?:\.|$)/.test(currentScope)
      range = editor.bufferRangeForScopeAtCursor(currentScope)
      text = editor.getTextInBufferRange(range)
    else
      text = editor.getWordUnderCursor()

    plugin.search(text, sensitive)

  contextMenu: () ->
    plugin.search(atom.workspace.getActiveTextEditor().getWordUnderCursor(), true)

  search: (string, sensitive) ->
    if sensitive
      language = atom.workspace.getActiveTextEditor().getGrammar().name

    spawn('open', ['-g', @createLink(string, language)])

  createLink: (string, language) ->
    # Attempt to pull default configuration from the user config. If this
    # does not exist, fall back to the default language map.
    if language
      keys = atom.config.get('dash.grammars.' + language)
      keys = map[language] if !keys

    link = 'dash-plugin://'

    if keys?.length
      link += 'keys=' + keys.map(encodeURIComponent).join(',') + '&'

    link += 'query=' + encodeURIComponent(string)
