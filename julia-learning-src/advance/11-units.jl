using Unitful
Unitful.preferunits(u"cm,g,s"...)

function main()

    a = 9.81*u"m/s^2"
    v0 = 5u"m/s"

    x(t) = v0*t + 1/2*a*t^2
    v(t) = v0 + a*t

    t1 = 5*u"s"

    # displaying units
    println(a)
    println(v0)
    println(x(t1))
    println(v(t1))

    # checking unit math
    # println(x(t1) + v(t1))

    # converting units
    println(uconvert(u"yr", t1))

    # checking dimensions 
    h = 10*u"ħ"
    println(h)
    println(typeof(h))

    # looking at SI units
    println(upreferred(h))

end

main()