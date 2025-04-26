function SetReminder()
  local reminder = MessageBox({
    title = 'Set Your Reminder',
    inputs = {{name = 'Enter Reminder Text', vkPlugin = 'TextInput', maxTextLength = 1000}},
    commands = {{name = 'Set Reminder', value = 1}, {name = 'Cancel', value = 0}}
  })

  if (reminder.result == 1) then
    for name, value in pairs(reminder.inputs) do
      if (ReminderText == nil) then
        ReminderText = tostring(value)
      else
        ReminderText = ReminderText .. '\n' .. tostring(value)
      end
    end
  end
end
return SetReminder