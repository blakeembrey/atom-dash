qs    = require('querystring')
spawn = require('child_process').spawn

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

    plugin.search(editor.getWordUnderCursor(), sensitive)

  contextMenu: () ->
    plugin.search(atom.workspace.getActiveEditor().getWordUnderCursor(), true)

  search: (string, sensitive) ->
    if sensitive
      language = atom.workspace.getActiveEditor().getGrammar().name

    spawn('open', [@createLink(string, language)])

  createLink: (string, language) ->
    keys = atom.config.get('dash.grammars.' + language) if language
    link = 'dash-plugin://'

    if keys?.length
      link += 'keys=' + keys.map(encodeURIComponent).join(',') + '&'

    link + 'query=' + encodeURIComponent(string)
