function example()
    string = 'Hello World'
    number = 23 + 2
    page = '1.310'
    boolean = true
    boolean2 = false
    ex = nil

    Printf('Hello World!')

    function Print(myString)
        Printf(myString)
    end

    Print('Hello World!')
    Print('I love Lua!')

    Confirm('Hello', 'This is a really cool function!', nil, false)
end
return example