function main()
  -- To retrieve the returned information provided by the MessageBox function, set a variable to the function

  local returnTable = MessageBox({
    --[[
    The main elements included in the MessageBox function are:
      Title - singular element
      Message - singular element
      Inputs - displayed in alphabetical ordere
      Radio Selectors - displayed in the order defined
      Swipe Selectors - displayed in the order defined
      States (Checkboxes) - displayed in alphabetical order
      Commands - displayed in the order defined
      
    These elements will always be displayed in this order; there is no way to alter it. 
    ]]

    -- The values referring to the title
    title = 'My Example MessageBox', -- The title for your messagebox
    titleTextColor = 1.7, -- The color for the title text. This references the colortheme in your showfile
    backColor = 1.11, -- The background color for the messagebox title bar and border. Also references the color theme in your showfile
    icon = 'object_smart', -- An icon for the left side of the title bar. The options can be found by using 'List' in the GraphicsRoot/TextureCollect/Textures cmd line destination
    
    -- The values referring to the message
    message = 'This is my example message text.\nI can create a line break with backslash "n"', -- The text displayed in your messagebox
    messageTextColor = 'Global.AlertText', -- The color for the message text. This references the colortheme in your showfile
    message_align_h = Enums.AlignmentH.Left, -- The horizontal alignment of your message text in the box. Can be Left, Right, or Center (default)

    -- The values that define what can close the messagebox
    autoCloseOnInput = false, -- Boolean which determines whether the messagebox will close when you press please or enter (true) or if it will wait for you to close it (false)
    timeout = 10000, -- Milliseconds until the messagebox autocloses
    timeoutResultCancel = true, -- Boolean which affects the result returned by the messagebox timing out
    timeoutResultID = 36, -- Optional specific value to be returned if the messagebox times out

    -- Commands are buttons which will automatically close the messagebox when pressed. The command's value is returned by the function
    --'commands' requires  a table of data for the commands. That table of commands requires an individual table for each command
    -- Commands are displayed in the order in which they appear in the table
    commands = {{
      value = 1, -- Returned if the button is pressed
      name = 'Yay!' -- Displayed on the button
    }, {
      value = 2, 
      name = 'Ok Whatever'
    }},

    -- Inputs are spaces where you can add text. This text is returned by the function
    --'inputs' requires  a table of data for the inputs. That table of inputs requires an individual table for each input
    -- Inputs are displayed in alphabetical order based on the name of each input
    inputs = {{
      name = 'Input 1', -- Displayed on the input; determines the inputs' location alphabetically relative to the other inputs
      value = 'Letters Only', -- The default value which is displayed in the input space
      blackFilter = '1234567890', -- Characters which can NOT be entered by the user
      vkPlugin = 'TextInput', -- Defines what type of keyboard is displayed if the keyboard icon is pressed. See user manual for options
      maxTextLength = 10 -- Max number of allowed characters
    }, {
      name = 'Input 2', 
      value = 'Numbers Only', 
      whiteFilter = '1234567890', -- Characters which CAN be entered by the user - anything not included can NOT be entered
      vkPlugin = 'NumericInput'
    }, {
      name = 'Input 3',
      value = 'Cue ID',
      whiteFilter = '1234567890.',
      vkPlugin = 'CueNumberInput'
    }},

    -- States are checkboxes which can be checked or unchecked. The state is returned by the function
    --'states' requires  a table of data for the states. That table of states requires an individual table for each state
    -- States are displayed in alphabetical order based on the name of each state
    states = {{
      name = 'Checkbox', -- The name displayed on the checkbox
      state = false -- Boolean determining if the checkbox defaults to checked (true) or unchecked (false)
    }},

    -- Selectors include two types of buttons: Swipe buttons (type 0) or Radio buttons (type 1). The selected value is returned by the function
    --'selectors' requires  a table of data for the selectors. That table of selectors requires an individual table for each selector
    -- Selectors are displayed in the order in which they appear in the table, but Radio buttons are always displayed before Swipe buttons
    selectors = {{
      name = 'Swipe Selector', -- The name displayed on the selector
      selectedValue = 1, -- The value that will be seleceted by default
      type = 0, -- The type of selector
      values = {['Option 1'] = 1, ['Option 2'] = 2, ['Option 3'] = 3} -- The values: ['Displayed Name'] = value (to be returned)
    }, {
      name = 'Radio Selector',
      selectedValue = 1,
      type = 1,
      values = {['Option 1'] = 1, ['Option 2'] = 2, ['Option 3'] = 3}
    }}
  })

  -- The values returned by the MessageBox function are stored in a table. To read them, we must access the corresponding table values.
  success = returnTable.success -- Boolean returns true if the table is closed by a timeout or a command button unless timeoutResultCancel is set to true, in which case it is false
  result = returnTable.result -- Returns the value of the command button that is pressed or the timeoutResultID, if defined, depending on how the pop-up was closed
  inputs = returnTable.inputs -- Returns a table with key/value pairs made up of the inputs' names and values
  states = returnTable.states -- Returns a table with key/value pairs made up of the states' names and boolean values
  selectors = returnTable.selectors -- Returns a table with key/value pairs made up of the selectors' names and boolean values
end
return main