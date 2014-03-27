module.exports =
  activate: (state) ->
    atom.workspaceView.command "ruby-define-method:new_instance_method", => @new_instance_method()

  new_instance_method: ->
    editor = atom.workspace.getActiveEditor()
    cursor = editor.getCursor()
    method_name = cursor.getCurrentBufferLine().trim()
    selection = editor.getSelection()
    editor.deleteLine()
    editor.insertNewlineAbove()
    editor.insertText("def " + method_name + "(var)\n\t\n")
    editor.insertText("end")
    cursor.moveUp(2)
    cursor.moveToEndOfLine()
    cursor.moveLeft()
    cursor.moveToBeginningOfWord()
    selection.selectWord()
    
    
