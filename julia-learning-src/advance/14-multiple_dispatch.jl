module moreUnits

using Unitful

const radEarth = 6378e3

@unit Re "Re" EarthRadii (radEarth)*Unitful.m false

const localpromotion = Unitful.promotion
function __init__()
    merge!(Unitful.promotion, localpromotion)
    Unitful.register(moreUnits)
end

end

using .moreUnits

functiona(v1::Vector, v2::Vector) = cross(v1, v2)
functiona(c::Real, A::Array) = A*c
functiona(v::Vector, M::Matrix) = M*v

function main()

    c = 2
    v1 = [1, 2, 3]
    v2 = [4, 5, 6]
    M = ones(3,3)

    a = 2*u"Re"
    a = uconvert(u"m", a)
    b = a / (radEarth*u"m")

    println(b)
    println(a)

end

main()





#     a = uconvert(u"m", a)
#     b = a / radEarth
#     println(b)