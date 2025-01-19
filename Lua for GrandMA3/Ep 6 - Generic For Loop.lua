function main()
  myTable = {10, 20, 30, 40, 50}
  table.insert(myTable, 60)

  myInfo = {name = 'John Doe', age = 36, birthplace = 'United States'}

 for key, value in ipairs(myTable) do
  Printf('This is my value: ' .. value)
 end

 for key, value in pairs(myInfo) do
  Printf('Key: ' .. key .. ' Value: ' .. value)
 end

 local returnTable = MessageBox({
  title = 'A Question for You',
  inputs = {{name = 'Input 1', value = '', vkPlugin = 'TextInput', maxTextLength = 100}, {name = 'Input 2', value = 'Something', vkPlugin = 'TextInput', maxTextLength = 100}, {name = 'Input 3', value = '3', vkPlugin = 'TextInput', maxTextLength = 100}},
  commands = {{name = 'OK', value = 1}}
 })

 for key, value in pairs(returnTable.inputs) do
  Printf(value)
 end
 
end
return main