# defining a const pie -- immutable
const pie = 3.14

# making the function
function main()

    r = 5

    # regular form function
    function circumference(r::Real)
        x = 2 * pie * r
        return x
    end

    # assignment form function
    c(r::Real) = 2 * π * r

    # print statements
    println(circumference(r))
    println(c(r))

    # println(U(10, 10, g=1000))

    # println(add(4, 5))
    # println(add(5, 5, 5, 5))

    # anonymous function
    # println(map(x -> 2 * π * x, [1, 5, 10]))

end

# function with keyword and default argument
function U(m::Real, h::Real; g::Real=10)
    m * g * h
end

# function with varargs -- "variable number arguments"
function add(x::Real, y...)

    x + sum(y)
end

# calling the function
main()