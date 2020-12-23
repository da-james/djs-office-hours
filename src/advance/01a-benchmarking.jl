using BenchmarkTools

module A

struct Triangle
    side1
    side2
    side3
    angle1
    angle2
    angle3
end

end # end of module A


module B

struct Triangle{T}
    side1   ::  T
    side2   ::  T
    side3   ::  T
    angle1  ::  T
    angle2  ::  T
    angle3  ::  T
end

end # end of module B

using .A
using .B

function main()

    a::Float64 = 5.0

    t = A.Triangle(a, a, a, a, a, a)
    # t = B.Triangle{Float64}(a, a, a, a, a, a)

end

@benchmark main()