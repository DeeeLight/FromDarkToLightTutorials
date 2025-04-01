local pluginName = select(1, ...)
local componentName = select(2, ...)
local signalTable = select(3, ...)
local myHandle = select(4, ...)
function CustomChecklist(Table)
  local DialogColumns = 0
  local DialogRows = 0
  local ElementPositionH = {}
  local ElementPositionV = {}
  local Element = {}
  local CheckboxState = {}
  local continue = false

  if (Table.dialogWidth == nil) then
    DialogWidth = 700
  else
    DialogWidth = Table.dialogWidth
  end

  for i = 1,100 do
    if (Table.elements[i] ~= nil) then
      if (Table.elements[1].positionH == nil) then
        ElementPositionH[i] = 0
      elseif(Table.elements[i].positionH ~= nil) then
        ElementPositionH[i] = Table.elements[i].positionH - 1
      end

      if (Table.elements[i].positionV == nil) then
        ElementPositionV[i] = i - 1
      else
        ElementPositionV[i] = Table.elements[i].positionV - 1
      end

      if (DialogColumns < ElementPositionH[i] + 1) then
        DialogColumns = ElementPositionH[i] + 1
      end
    
      if (DialogRows < ElementPositionV[i] + 1) then
        DialogRows = ElementPositionV[i] + 1
      end
    else
      break
    end
  end

  local baseInput = GetFocusDisplay().ScreenOverlay:Append('BaseInput')
  baseInput.Name = 'DMXTesterWindow'
  baseInput.H = 0
  baseInput.W = DialogWidth
  baseInput.Columns = 1
  baseInput.Rows = 2
  baseInput[1][1].SizePolicy = 'Fixed'
  baseInput[1][1].Size = 60
  baseInput[1][2].SizePolicy = 'Stretch'
  baseInput.AutoClose = 'No'
  baseInput.CloseOnEscape = 'Yes'

  local titleBar = baseInput:Append('TitleBar')
  titleBar.Columns = 2  
  titleBar.Rows = 1
  titleBar.Anchors = '0,0'
  titleBar[2][2].SizePolicy = 'Fixed'
  titleBar[2][2].Size = 50
  titleBar.Texture = 'corner2'

  local titleBarIcon = titleBar:Append('TitleButton')
  titleBarIcon.Text = Table.title
  titleBarIcon.Texture = 'corner1'
  titleBarIcon.Anchors = '0,0'
  titleBarIcon.Icon = 'star'

  local titleBarCloseButton = titleBar:Append('CloseButton')
  titleBarCloseButton.Anchors = '1,0'
  titleBarCloseButton.Texture = 'corner2'

  local dlgFrame = baseInput:Append('DialogFrame')
  dlgFrame.H = '100%'
  dlgFrame.W = '100%'
  dlgFrame.Columns = 1
  dlgFrame.Rows = 2
  dlgFrame.Anchors = '0,1'
  dlgFrame[1][1].SizePolicy = 'Fixed' --This should be set to stretch so you can have multiple rows of checkboxes without issue
  dlgFrame[1][1].Size = 60 --This line should be deleted if the previous line is set to stretch
  dlgFrame[1][2].SizePolicy = 'Fixed'
  dlgFrame[1][2].Size = 60 

  local checkBoxGrid = dlgFrame:Append("UILayoutGrid")
  checkBoxGrid.Columns = DialogColumns
  checkBoxGrid.Rows = DialogRows
  checkBoxGrid.Anchors = '0,0'
  checkBoxGrid.Margin = '0,5'

  local function ActivateCheckbox(index)
    Element[index] = checkBoxGrid:Append("CheckBox")
    Element[index].Anchors = {
      top = ElementPositionV[index],
      bottom = ElementPositionV[index],
      left = ElementPositionH[index],
      right = ElementPositionH[index]
    }
    Element[index].Text = Table.elements[index].name
    Element[index].TextalignmentH = "Left"
    Element[index].State = CheckboxState[index]
    Element[index].PluginComponent = myHandle
    Element[index].Clicked = "CheckBoxClicked"
  end

  local function ActivateSubtitle(index)
    Element[index] = checkBoxGrid:Append('UIObject')
    Element[index].Text = Table.elements[index].name
    Element[index].ContentDriven = 'Yes'
    Element[index].ContentWidth = 'No'
    Element[index].TextAutoAdjust = 'Yes'
    Element[index].Anchors = {
      top = ElementPositionV[index],
      bottom = ElementPositionV[index],
      left = ElementPositionH[index],
      right = ElementPositionH[index]
    }
    Element[index].Padding = '20, 15'
    Element[index].Font = 'Medium20'
    Element[index].HasHover = 'No'
    Element[index].BackColor = Root().ColorTheme.ColorGroups.Global.Transparent
  end

  for i = 1,100 do
    if (Table.elements[i] ~= nil) then
      if (Table.elements[i].type == 'Checkbox') then
        if (Table.elements[i].state == 1) then
          CheckboxState[i] = 1
        else
          CheckboxState[i] = 0
        end
        ActivateCheckbox(i)
      elseif(Table.elements[i].type == 'Subtitle') then
        ActivateSubtitle(i)
      end
    else
      break
    end
  end

  local buttonGrid = dlgFrame:Append('UILayoutGrid')
  buttonGrid.Columns = 1
  buttonGrid.Rows = 1
  buttonGrid.Anchors = '0,1'

  local applyButton = buttonGrid:Append('Button')
  applyButton.Anchors = '0,0'
  applyButton.Textshadow = 1
  applyButton.HasHover = 'Yes'
  applyButton.Text = 'Apply'
  applyButton.Font = 'Medium20'
  applyButton.TextalignmentH = 'Centre'
  applyButton.PluginComponent = myHandle
  applyButton.Clicked = 'ButtonClicked'


  signalTable.CheckBoxClicked = function(caller)
    if (caller.State == 1) then
      caller.State = 0
    else
      caller.State = 1
    end

    for i = 1, 100 do
      if (Element[i] ~= nil) then
        if (Element[i].State == 0) then
          CheckboxState[i] = 0
        elseif (Element[i].State == 1) then
          CheckboxState[i] = 1
        end
      end
    end
  end

  signalTable.ButtonClicked = function(caller)
    GetFocusDisplay().ScreenOverlay:ClearUIChildren()
    continue = true
  end

  repeat
  until continue

  return CheckboxState
end

function main()
  if (myStates == nil) then
    myStates = {}
  end
  myStates = CustomChecklist({title = 'My new title', elements = {{
    type = 'Subtitle', name = 'Text to display', positionH = 1, positionV = 1},{
    type = 'Checkbox', name = 'Text on Checkbox', positionH = 2, positionV = 1, state = myStates[2]}, {
    type = 'Checkbox', name = 'Checkbox 2', positionH = 3, positionV = 1, state = myStates[3]
    }}})
end
return main