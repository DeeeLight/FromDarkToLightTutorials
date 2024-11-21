function main()
    if (myVar == 35) then
        Printf('It is 35')
    elseif (myVar == 36) then
        Printf('It is 36')
    elseif (myVar ~= nil) then
        Printf('Number not found')
    end

    local Answer = Confirm('Hey', 'Confirm me!')
    if (Answer) then
        Printf('User confirmed')
    elseif(Answer == false) then
        Printf('User canceled')
    end
end
return main