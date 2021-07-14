using Plots
using Polynomials

function main()

    # legendre_poly()
    spherical_harmonics()

end

function legendre_poly()

    n = 5
    xlin = range(-1, 1, length=100)

    plot(xaxis=("x", (-1,1)), yaxis=("y", (-1,1)), title="Legendre Polynomials",
         framestyle=:origin, legend=:outertopright, dpi=300)
    for i in 0:n

        pn = Pn(i)
        plot!(xlin, pn.(xlin), label="P"*string(i))

    end

    savefig("lp.png")

end

function Pn(n)
    p0 = Polynomial([-1, 0, 1])

    an = 1/(2^n * factorial(n))

    dp = (p0)^n
    for i in 1:n

        dp = derivative(dp)

    end

    return an*dp
end

function spherical_harmonics()

    theta = range(0, 2π, length=100)
    phi = range(0, π/2, length=100)

    n = 0
    m = 0

    plot3d(theta, phi, Ynm.(theta, phi, n, m))

end

function Ynm(θ, ϕ, n, m)

    pn = Pn(n)
    dp = pn
    pm = abs(m)

    for i in 0:pm
        dp = derivative(dp)
    end

    ptheta = (-1)^pm * sin(θ)^pm * dp(cos(θ))

    if m >= 0
        return ptheta * cos(m*ϕ)
    else
        return ptheta * sin(pm*ϕ)
    end

end

main()