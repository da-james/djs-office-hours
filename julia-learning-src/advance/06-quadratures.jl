using QuadGK


function main()

    f(x) = x^2
    g(x) = x^4
    h(x) = (x+1)^(-1)

    a = 0
    b = 2
    n = 10

    println(simpsons(f, a, b, n))
    println(quadgk(f, a, b, rtol=1e-5))

    println(simpsons(g, a, b, n))
    println(quadgk(g, a, b, rtol=1e-5))

    println(simpsons(h, a, b, n))
    println(quadgk(h, a, b, rtol=1e-5))
end


function simpsons(df, a, b, n)

    # n should be even
    h = (b - a) / n

    xi0 = df(a) + df(b)         # end points
    xi1 = 0                     # odd points
    xi2 = 0                     # even points

    # performing integration
    for i in 1:n-1

        x = a + i*h

        # if even add to xi2
        if i%2 == 0
            xi2 += df(x)
        else
            # else odd add to xi1
            xi1 += df(x)
        end
    end

    # add everything togeteher
    xi = h*(xi0 + 2*xi2 + 4*xi1)/3

    return xi

end

main()