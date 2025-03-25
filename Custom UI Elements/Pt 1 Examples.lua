function Example()
  local key, value = PopupInput({
    title = 'an option',
    caller = GetFocusDisplay(),
    items = {'Option 1', 'Option 2'}
  })

  local userInput = TextInput('this text box', 'Some default text')
end
return Example