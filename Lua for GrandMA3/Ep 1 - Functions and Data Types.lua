function main()
    string = 'Hello World'
    number = 1.310
    string2 = '1.310'
    boolean = false
    myVar = nil

    Printf(string)

    function Print(myString)
        Printf(myString)
    end

    Print('Words')

    Confirm('Title', 'Hello! This is my text')
end
return main