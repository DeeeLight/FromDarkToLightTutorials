--<version="1.0"/version>
--<build="6"/build>

function Main(display, arg)
  --Printf(arg)

  a, b = string.find('This is my string', ' is')

  Args = {}
  local i = 0
  local lastArg = 1
  while true do
    x, i = string.find(arg, ', ', i + 1)
    if (i == nil) then
      table.insert(Args, string.sub(arg, lastArg, -1))
      break
    else
      table.insert(Args, string.sub(arg, lastArg, x -1))
      lastArg = i + 1
    end
  end

  function OurTime(UTC)
    if tonumber(UTC) < 5 then
      UTC = tonumber(UTC +24)
    end
    local realtime = UTC - 5
    return realtime
  end

  Printf(OurTime(os.date('%H')))

  Echo('Hi')
  ErrEcho('Hello!')
  ErrPrintf('hi!')
end
return Main