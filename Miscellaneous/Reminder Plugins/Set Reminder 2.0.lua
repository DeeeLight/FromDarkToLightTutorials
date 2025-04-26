function SetReminder()
  NoService = {{value = 1, name = 'Remind Me Soon'}, {value = 10, name = 'Cancel'}}
  Rehearsal = {{value = 1, name = 'Remind Me Soon'}, {value = 2, name = 'Remind Me After Rehearsal'}, {value = 3, name = 'Remind Me After Service'}, {value = 10, name = 'Cancel'}}
  SundayRehearsal = {{value = 1, name = 'Remind Me Soon'}, {value = 2, name = 'Remind Me After Rehearsal'}, {value = 3, name = 'Remind Me After Service'}, {value = 4, name = 'Remind Me After 2nd Service'}, {value = 10, name = 'Cancel'}}
  Sunday9 = {{value = 1, name = 'Remind Me Soon'},{value = 3, name = 'Remind Me After Service'}, {value = 4, name = 'Remind Me After 2nd Service'}, {value = 10, name = 'Cancel'}}
  Service = {{value = 1, name = 'Remind Me Soon'},{value = 3, name = 'Remind Me After Service'}, {value = 10, name = 'Cancel'}}
  if not (TablesSet) then
    NextReminder = {}
    PostRReminder = {}
    PostSReminder = {}
    PostS2Reminder = {}
    TablesSet = true
  end
  if (os.date('%A') == 'Sunday' and os.date('%X') > '10:20:00' and not ChangeOver) then
    PostSReminder = PostS2Reminder
    PostS2Reminder = {}
    ChangeOver = true
  end

  if (os.date('%A') == 'Sunday') then
    if (os.date('%X') < '07:55:00') then
      CommandTable = SundayRehearsal
    elseif (os.date('%X') < '10:20:00') then
      CommandTable = Sunday9
    elseif (os.date('%X') < '12:20:00') then
      CommandTable = Service
    else
      CommandTable = NoService
    end
  elseif (os.date('%A') == 'Wednesday') then
    if (os.date('%X') < '18:00:00') then
      CommandTable = Rehearsal
    elseif(os.date('%X') < '20:00:00') then
      CommandTable = Service
    else
      CommandTable = NoService
    end
  else
    CommandTable = NoService
  end
  local reminder = MessageBox({
    title = 'Set Your Reminder',
    inputs = {{name = 'Enter Reminder Text', vkPlugin = 'TextInput', maxTextLength = 1000}},
    commands = CommandTable
  })

  if (reminder.result == 1) then
    for name, value in pairs(reminder.inputs) do
      table.insert(NextReminder, tostring(value))
    end
  elseif (reminder.result == 2) then
    for name, value in pairs(reminder.inputs) do
      table.insert(PostRReminder, tostring(value))
    end
  elseif(reminder.result == 3) then
    for name, value in pairs(reminder.inputs) do
      table.insert(PostSReminder, tostring(value))
    end
  elseif(reminder.result == 4) then
    for name, value in pairs(reminder.inputs) do
      table.insert(PostS2Reminder, tostring(value))
    end
  end
end
return SetReminder