function main()
    Cmd('Label Sequence 1 "Test"')
    CmdIndirect('Label Sequence 1 "Test 2"')
    CmdIndirectWait('')

    function ConfirmHaze()
        local UserOK = Confirm('Hey', 'It\'s time to run haze for rehearsal. OK to proceed?')
        if (UserOK) then
            CmdIndirectWait('Go+ Page 1.115')
        end
    end

    ConfirmHaze()
end
return main