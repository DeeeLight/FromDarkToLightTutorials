function DisplayReminder(display, reminderArg)
  if (reminderArg == 'Post-Rehearsal') then
    CurrentReminder = PostRReminder
    PostRReminder = {}
  elseif(reminderArg == 'Post-Service') then
    CurrentReminder = PostSReminder
    PostSReminder = {}
    if (os.date('%A') == 'Sunday' and os.date('%X') < '11:00:00') then
      PostSReminder = PostS2Reminder
    else
      PostSReminder ={}
    end
  elseif(reminderArg == 'Regular') then
    CurrentReminder = NextReminder
    NextReminder = {}
  end

  for i, text in ipairs(CurrentReminder) do
    if (ReminderText == nil) then
      ReminderText = text
    else
      ReminderText = ReminderText .. '\n\n' .. text
    end
  end

  if (ReminderText ~= nil) then
    local reminder = MessageBox({
      title = 'Hey!',
      message = ReminderText,
      commands = {{name = 'Remind Me Again', value = 1}, {name = 'Ok, Got It!', value = 0}}
    })

    if (reminder.result ~= 0) then
      NextReminder = ReminderText
    end
  end
end
return DisplayReminder