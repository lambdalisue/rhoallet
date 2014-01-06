selectAll = (elem) ->
  if getSelection? and document.createRange?
    selection = getSelection()
    range = document.createRange()
    range.selectNodeContents(elem)
    selection.removeAllRanges()
    selection.addRange(range)
  else if document.selection? and document.body.createTextRange?
    range = document.body.createTextRange()
    range.moveToElementText(elem)
    range.select()
