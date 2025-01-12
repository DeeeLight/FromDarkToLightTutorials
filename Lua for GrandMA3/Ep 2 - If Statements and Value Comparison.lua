function main()
    if (myVar == 35) then
        Printf('myVar is 35')
    elseif (myVar < 35) then
        Printf('myVar is less than 35')
    elseif (myVar > 35 and myVar < 40) then
        Printf('myVar is more than 35')
    else
        Print('Number is too large')
    end
    
    local Answer = Confirm('Hey', 'Confirm me!')

    if (Answer) then
        Printf('User confirmed the pop-up.')
    elseif (Answer == false) then
        Printf('User canceled the pop-up.')
    end
end
return main