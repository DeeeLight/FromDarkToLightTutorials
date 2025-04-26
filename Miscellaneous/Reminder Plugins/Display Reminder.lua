function DisplayReminder()
  if (ReminderText ~= nil) then
    local reminder = MessageBox({
      title = 'Hey!',
      message = ReminderText,
      commands = {{name = 'Remind Me Again', value = 1}, {name = 'Ok, Got It!', value = 0}}
    })

    if (reminder.result == 0) then
      ReminderText = nil
    end
  end
end
return DisplayReminder