using Plots
using DifferentialEquations

function eulers_method(f::Function, α::Real, a::Real, b::Real, N::Int64)

    n1 = N + 1
    u = zeros(n1,2)

    h = (b - a) / N
    u[1,1] = a
    u[1,2] = α

    for i in 2:n1
        u[i,2] = u[i-1,2] + h * f(u[i-1,1], u[i-1,2])
        u[i,1] = a + (i - 1) * h
    end

    return u
end

function rk4_method(f::Function, α::Real, a::Real, b::Real, N::Int64)

    n1 = N + 1
    u = zeros(n1,2)

    h = (b - a) / N
    u[1,1] = a
    u[1,2] = α

    for i in 2:n1
        t = u[i-1,1]
        w = u[i-1,2]

        k1 = h * f(t, w)
        k2 = h * f(t + h / 2, w + k1 / 2)
        k3 = h * f(t + h / 2, w + k2 / 2)
        k4 = h * f(t + h, w + k3)

        u[i,2] = w + (k1 + 2 * k2 + 2 * k3 + k4) / 6
        u[i,1] = a + (i - 1) * h
    end

    return u
end

function main()

    # one_ode()
    system_ode()

end

function one_ode()
    
    df(t,y) = y - t^2 + 1
    f(t) = -0.5*exp(t) + t^2 + 2t + 1

    u0 = 0.5
    a = 0
    b = 2
    n = 10
    tlin = 0:0.2:2

    sol1 = eulers_method(df, u0, a, b, n)
    sol2 = rk4_method(df, u0, a, b, n)

    # DE library
    df(u,p,t) = u - t^2 + 1
    tspan = (0., 2.)
    prob = ODEProblem(df, u0, tspan)
    sol3 = solve(prob)

    plot(tlin, f.(tlin), label="exact", legend=:bottomright, dpi=150)

    plot!(sol3.t, sol3.u, markershape=:x, label="DE Lib")

    plot!(sol2[:,1], sol2[:,2], markershape=:+, label="rk4")
    plot!(sol1[:,1], sol1[:,2], markershape=:o, label="eulers")

end

function system_ode()

    # du - output solutions
    # u  - input points
    # p  - parameters
    # t  - time
    function df(du, u, p, t)

        du[1] = -4u[2] + cos(t)
        du[2] = u[1]

    end

    u0 = [0, 0]
    tspan = (0, 1.0)
    prob = ODEProblem(df, u0, tspan)
    sol = solve(prob)

    # plot(sol, label=["x" "y"], dpi=150)
    plot(sol, vars=(1,2), label="f(x,y,t)", dpi=150)
end

main()