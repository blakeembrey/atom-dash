qs    = require('querystring')
Shell = require('shell')

plugin = module.exports =
  configDefaults:
    grammars: require('./map')

  activate: () ->
    atom.workspaceView.command('dash:shortcut', @shortcut)
    atom.workspaceView.command('dash:shortcut-alt', @shortcut.bind(@, false))
    atom.workspaceView.command('dash:context-menu', @contextMenu)

  shortcut: (sensitive) ->
    editor    = atom.workspace.getActiveEditor()
    selection = editor.getSelection().getText()

    return plugin.search(selection, sensitive) if selection

    scopes       = editor.getCursorScopes()
    currentScope = scopes[scopes.length - 1]

    # Use the current cursor scope if available. If the current scope is a
    # string, comment or not available, get the current word under the cursor.
    # Ignore: comment (any), string (any), meta (html), markup (md).
    if scopes.length > 1 && !/^(?:comment|string|meta|markup)(?:\.|$)/.test(currentScope)
      range = editor.bufferRangeForScopeAtCursor(currentScope)
      text  = editor.getTextInBufferRange(range)
    else
      text = editor.getWordUnderCursor()

    plugin.search(text, sensitive)

  contextMenu: () ->
    plugin.search(atom.workspace.getActiveEditor().getWordUnderCursor(), true)

  search: (string, sensitive) ->
    if sensitive
      language = atom.workspace.getActiveEditor().getGrammar().name

    Shell.openExternal(@createLink(string, language))

  createLink: (string, language) ->
    keys = atom.config.get('dash.grammars.' + language) if language
    link = 'dash-plugin://'

    if keys?.length
      link += 'keys=' + keys.map(encodeURIComponent).join(',') + '&'

    link + 'query=' + encodeURIComponent(string)
