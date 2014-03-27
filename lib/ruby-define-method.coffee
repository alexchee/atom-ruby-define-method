module.exports =
  activate: (state) ->
    atom.workspaceView.command "ruby-define-method:new_instance_method", => @new_instance_method()

  new_instance_method: ->
    editor = atom.workspace.getActiveEditor()
    cursor = editor.getCursor()
    method_name = cursor.getCurrentBufferLine().trim()
    selection = editor.getSelection()
    editor.deleteLine()
    editor.insertText("def " + method_name + "(var)\n\t\nend\n", {
      autoIndent: true
      autoIndentNewline: true
      autoDecreaseIndent: true
      undo: 'skip'
    })
    cursor.moveUp(3)
    cursor.moveToEndOfLine()
    cursor.moveLeft()
    selection.selectToBeginningOfWord()
