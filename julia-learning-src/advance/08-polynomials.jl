using Polynomials
using Plots

function main()

    xlin = range(-5, 5, length=200)

    # creating polynomials
    p = Polynomial([1, 3, 5])   # generating by coefficients
    q = fromroots([1, -4, 4])   # generating by roots

    # evaluating
    println(p)
    println(q)


    # math operations
    println(p(2))
    println(p + q)
    println(2*p - q)

    # derivatives and integrals
    println(derivative(p))
    println(integrate(p))

    # roots
    println(roots(q))

    # what are the roots and extrema of q?
    xq = roots(q)

    qprime = derivative(q)
    xqq = roots(qprime)

    plot(xlin, q.(xlin), label=string(q), legend=:bottomright, framestyle=:zerolines, dpi=150)
    plot!(xlin, qprime.(xlin), label=string(qprime))
    scatter!(xq, q.(xq), label="roots")
    scatter!(xqq, q.(xqq), label="extrema")

end


main()


    # xq = roots(q)
    # qprime = derivative(q)
    # xqq = roots(qprime)