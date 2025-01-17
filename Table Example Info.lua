function TableExampleInfo()
  -- When you create a table, you can give the keys any value of any data type
  stringVariable = 'myString' -- This variable can be used to add to a table using brackets or a '.' but not in creating a table in braces
  myTable = {string = 1, otherString = 'My Table Value'} -- These blue keys are actually strings. You can't put them in parentheses here but must to call them using brackets

  myTable[stringVariable] = true -- The index for this value is 'myString'
  myTable.stringVariable = true -- This sytax is also valid and does the same thing
  myTable['myString'] = true -- So does this
  myTable.myString = true -- And this
  -- You can't use a string with spaces the last way

  myTable[5] = 'My index is 5' -- This creates a value at index 5. You can't do it using braces or a '.'

  -- You can add to a table using table.insert but you must create the table first and you can only specify a numeric index
  myNewTable = {1, 2} -- It can be empty or contain values to start with but you can't add a value at a specific index unless it already exists
  table.insert(myNewTable, 2, 'My index is 2') -- This inserts a value at index 2 and pushes the rest over one. They are now ordered, {1, 'My index is 2', 2}
  table.insert(myNewTable, 'Next empty index starting at 1') -- This one inserts a value at the next empty numeric index

  -- You can also insert a table in a table
  myTable['InnerTable'] = {'This is a value', 'Here is another one'} -- These table values are at index 1 and 2

  -- To retrieve table values, it is the same process. Here is a way to reference a table within a table
  myValue = myTable.InnerTable[1]
  alsoMyValue = myTable['InnerTable'][1]
  -- When you set a value to a table value it takes on that value, not a reference. In other words, if you delete or change myTable.InnerTable[1] now, myValue doesn't change

end
return TableExampleInfo