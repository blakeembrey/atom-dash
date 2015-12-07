dash = require('../lib/dash')

describe "dash", ->
  it "should open dash", ->
    waitsForPromise ->
      atom.workspace.open('test.hs').then (editor) ->
        view = atom.views.getView(editor)

        editor.setCursorBufferPosition({ row: 1, column: 6 })

        new Promise (resolve, reject) ->
          dash.exec = (cmd) ->
            expect(cmd).toEqual('open -g "dash-plugin://query=.SetFlags"')
            resolve()

          dash.shortcut(true)

  it "should open dash with background", ->
    waitsForPromise ->
      atom.workspace.open('test.hs').then (editor) ->
        view = atom.views.getView(editor)

        editor.setCursorBufferPosition({ row: 1, column: 6 })

        new Promise (resolve, reject) ->
          dash.exec = (cmd) ->
            expect(cmd).toEqual('open -g "dash-plugin://query=.SetFlags&prevent_activation=true"')
            resolve()

          dash.shortcut(true, true)
