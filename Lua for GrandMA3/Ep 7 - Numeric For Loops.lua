function main()
  for i = 1, 10, 2 do
    Printf('My number is ' .. i)
  end

  if (IsObjectValid(FromAddr('Sequences.Praise', DataPool()))) then
    mySongList = {'Praise'}
    for i = 1, 100 do
      if (IsObjectValid(FromAddr('Sequences.Praise#' .. i, DataPool()))) then
        table.insert(mySongList, 'Praise#' .. i)
      else
        break
      end
    end
  end

  PostWorshipSequences = {}
  SermonDefaults = {'Greet People', 'Video Announcements', 'Video Sermon', 'Live Pastor Up', 'Dismiss'}


  local ConfirmServiceFlow = MessageBox({
    title = 'Confirm',
    message_align_h = Enums.AlignmentH.Left,
    message = 'Is this the right service flow for today?\n\t' .. SermonDefaults[1] .. '\n\t' .. SermonDefaults[2] .. '\n\t' .. SermonDefaults[3] .. '\n\t' .. SermonDefaults[4] .. '\n\t' .. SermonDefaults[5],
    commands = {{value = 1, name = 'Yes'}, {value = 0, name = 'No'}}
  })

  if ConfirmServiceFlow.result == 1 then
   for i = 1, 5 do 
     PostWorshipSequences[i] = SermonDefaults[i]
   end
  else
    local ManualSetup = MessageBox({
    title = 'Set Up Post-Worship',
      message_align_h = Enums.AlignmentH.Left,
      message = 'These are the names of the sequences which can be used for service.\n\t' .. SermonDefaults[1] .. '\n\t' .. SermonDefaults[2] .. '\n\t' .. SermonDefaults[3] .. '\n\t' .. SermonDefaults[4] .. '\n\t' .. SermonDefaults[5] .. '\nPlease type the name of each element in the box for its place in the sevice flow.',
      commands = {{value = 1, name = 'Confirm'}},
      inputs = {{name = 'Sequence 1', vkPlugin = 'TextInput', maxTextLength = 50}, {name = 'Sequence 2', vkPlugin = 'TextInput', maxTextLength = 50},{name = 'Sequence 3', vkPlugin = 'TextInput', maxTextLength = 50},{name = 'Sequence 4', vkPlugin = 'TextInput', maxTextLength = 50},{name = 'Sequence 5', vkPlugin = 'TextInput', maxTextLength = 50}}
    })
    for name, value in pairs(ManualSetup.inputs) do
      if (value ~= nil) then
        for i = 1, 5 do
          if (name == 'Sequence ' .. i) then
            PostWorshipSequences[i] = tostring(value)
          end
        end
      end
    end
  end

end
return main