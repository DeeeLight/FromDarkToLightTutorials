function main()
    --[[Make sure you set myVar before running this code or you will get an error. 
    Once it has been set by running the code, deleting that code does not cause a problem until the system is reset.
    This is why it still worked in my video after I deleted that code.]]
    if (myVar == 35) then
        Printf('myVar is 35')
    elseif (myVar < 35) then
        Printf('myVar is less than 35')
    elseif (myVar > 35 and myVar < 40) then
        Printf('myVar is more than 35')
    else
        Printf('Number is too large')
    end
    
    local Answer = Confirm('Hey', 'Confirm me!')

    if (Answer) then
        Printf('User confirmed the pop-up.')
    elseif (Answer == false) then
        Printf('User canceled the pop-up.')
    end
end
return main