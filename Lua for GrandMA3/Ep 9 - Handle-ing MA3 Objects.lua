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
  Handle:Dump() -- I changed this after it was pointed out to me that Dump prints on its own, so my overlapping text in the cmd history was caused by 2 simultaneous prints.
  Printf('----------End of Dump-----------------')]]
end
return Main
