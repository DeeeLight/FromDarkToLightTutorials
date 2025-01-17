function main()
  myTable = {a = 1}

  myTable['b'] = 2
  myTable.c = 3
  
  MyNewTable = {10, 20, 25}
  table.insert(MyNewTable, 2, 'A value')

  MySequence = {name = 'Test', ID = 1}
  CmdIndirectWait('Store Sequence ' .. MySequence.ID .. ' /noconfirm; Label Sequence ' .. MySequence.ID .. ' "' .. MySequence.name .. '"')
end
return main