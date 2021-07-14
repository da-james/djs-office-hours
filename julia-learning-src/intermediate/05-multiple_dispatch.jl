abstract type Shape end

struct Circle <: Shape
    r::Real
end

struct Rectangle <: Shape
    l::Real
    w::Real
end

struct Square <: Shape
    l::Real
end

area(a::Circle) = π*a.r^2
area(a::Rectangle) = a.l * a.w
area(a::Square) = a.l^2


function main()

    # numbers_example()
    shapes_example()

end

function numbers_example()

    c = 1 + 2im
    r = 5

    println(c + c)
    println(c + r)
    @which c + c

end

function shapes_example()

    c = Circle(3)
    r = Rectangle(4, 5)
    s = Square(5)

    println(area(c))
    println(area(r))
    println(area(s))

end

main()