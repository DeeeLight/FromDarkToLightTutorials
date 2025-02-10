function main()
  MyNum = 0
  while (MyNum < 10) do
    Printf('MyNum is less than 10')
    MyNum = MyNum + 1
  end
  Printf('MyNum is 10 now!')

  MyNum = 0
  repeat
    MyNum = MyNum + 1
    if (MyNum == 2) then
      Printf('My Number is 2')
    else
      Printf('My number is not 2')
    end
  until MyNum > 2

  SongSetup = nil
  SequenceLocation = 1

  repeat
   if (IsObjectValid(FromAddr("Sequences." .. SequenceLocation, DataPool()))) then
     local question = MessageBox({
       title = 'Hey',
       message = 'The location for your sequences to be copied to is currently occupied. Would you like to use the existing ones, delete them and put new ones in, or try a different location?',
       commands = {{value = 1, name = 'Delete them'}, {value = 2, name = 'Use them'}, {value = 3, name = 'Try a different location'}, {value = 4, name = 'Cancel setup'}}
     })
     if question.result == 1 then
       CmdIndirectWait('Delete Sequence 1 thru 4')
       SongSetup = 'Approved'
     elseif question.result == 2 then
       SongSetup = 'Assignments Only'
     elseif question.result == 3 then
        SequenceLocation = SequenceLocation + 10
     else
        SongSetup = 'Cancelled'
     end
   else
     SongSetup = 'Approved'
   end
  until SongSetup ~= nil

end
return main