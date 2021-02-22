# type
abstract type Shape{T} end

struct Ellipse{T} <: Shape{T}
    a::T
    b::T
end

# parametrics
struct Rectangle{T1,T2} <: Shape{T1}
    len::T1
    wid::T2
end

struct Square{T} <: Shape{T}
    side::T
end

function area(s::Shape)
    
    if isa(s, Rectangle)
        return s.len * s.wid
    else
        return s.side^2
    end

end


function main()

    r = Rectangle{Float64, Float64}(5.0, 4.0)
    s = Square{Float64}(5.0)

    println(area(r))

end

main()