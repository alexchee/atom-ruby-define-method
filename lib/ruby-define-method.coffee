module.exports =
  activate: (state) ->
    'use strict'
    
    atom.workspaceView.command "ruby-define-method:new_instance_method", => @new_instance_method()

  new_instance_method: ->
    editor = atom.workspace.getActiveEditor()
    cursor = editor.getCursor()
    method_name = cursor.getCurrentBufferLine().trim()
    selection = editor.getSelection()
    selection.selectLine()
    editor.insertText("def " + method_name + "(var)\n\t\nend\n", {
      autoIndent: true
      autoIndentNewline: true
      autoDecreaseIndent: true
    })
    cursor.moveUp(3)
    cursor.moveToEndOfLine()
    cursor.moveLeft()
    selection.selectToBeginningOfWord()
