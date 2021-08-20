using Debugger

function main()

    a = 5
    println(fact(a))

end

function rec_sum(x)

    # base case
    if x == 0
        return x
    else
        # recursive call
        return x + rec_sum(x - 1)
    end

end


function fact(x)

    println(x)

    if x <= 1
        return 1
    else
        return x * fact(x - 1)
    end

end

function fib(x)

    if x < 2
        return x
    else
        return fib(x - 1) + fib(x - 2)
    end

end


main()
