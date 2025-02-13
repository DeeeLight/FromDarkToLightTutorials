function Main()
  local mySequenceHandle = FromAddr("ShowData.DataPools.Default.Sequences.1")
  Printf(tostring(mySequenceHandle))
  Printf(tostring(mySequenceHandle:Addr()))

  local Handle = ObjectList('Sequence 1 Cue 3')[1]
  if (IsObjectValid(Handle)) then
    Printf(Handle.name)
  end
  --Handle.name = 'Test'

  --[[Printf('----------Beginning of Dump-------------')
  Printf(tostring(Handle:Dump()))
  Printf('----------End of Dump-----------------')]]
end
return Main