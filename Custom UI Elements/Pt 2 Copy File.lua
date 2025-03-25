local pluginName = select(1, ...)
local componentName = select(2, ...)
local signalTable = select(3, ...)
local myHandle = select(4, ...)
function Main()
  local baseInput = GetFocusDisplay().ScreenOverlay:Append('BaseInput')
  baseInput.Name = 'DMXTesterWindow'
  baseInput.H = 0
  baseInput.W = 600
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
  titleBarIcon.Text = 'Dialog Example'
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
  dlgFrame[1][1].SizePolicy = 'Fixed'
  dlgFrame[1][1].Size = 60
  dlgFrame[1][2].SizePolicy = 'Fixed'
  dlgFrame[1][2].Size = 60

  local subTitle = dlgFrame:Append('UIObject')
  subTitle.Text = 'This example contains a subtitle.'
  subTitle.ContentDriven = 'Yes'
  subTitle.ContentWidth = 'No'
  subTitle.TextAutoAdjust = 'Yes'
  subTitle.Anchors = '0, 0'
  subTitle.Padding = '20, 15'
  subTitle.Font = 'Medium20'
  subTitle.HasHover = 'No'
  subTitle.BackColor = Root().ColorTheme.ColorGroups.Global.Transparent

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

  signalTable.ButtonClicked = function(caller)
    GetFocusDisplay().ScreenOverlay:ClearUIChildren()
  end
end
return Main