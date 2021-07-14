# structs (also known as classes)
struct Prism
    # field values
    length::Real
    width::Real
    height::Real

    # struct constructor -- no arguments
    function Prism()
        new(1, 1, 1)
    end

    # constructor -- 3 arguments
    function Prism(l::Real, w::Real, h::Real)

        # catching errors for the user
        if l < 0 || w < 0 || h < 0
            error("Can't have negative values for lengths.")
        elseif l < w
            error("Can't have shorter length than width.")
        else
            new(l, w, h)
        end
    end
end

# passing structs to functions
function volume(p::Prism)
    # accessing a struct's field values
    v = p.length * p.width * p.height
end

function surface_area(p::Prism)
    s1 = p.length * p.width
    s2 = p.length * p.height
    s3 = p.width * p.height

    sa = 2 * (s1 + s2 + s3)
end

# mutable struct
# can alter field values after creating
mutable struct Circle
    radius
end

# constructor
function Circle_const(r::Real)
    Circle(r)
end

function main()

    # using first constructor of Prism struct
    p = Prism()
    # using second constructor of Prism struct
    p1 = Prism(1, 2, 3)

    # constructing a Circle
    c = Circle_const(5)

end

main()