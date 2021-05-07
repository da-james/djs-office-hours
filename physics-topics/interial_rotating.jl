using Plots
using DifferentialEquations

@userplot threebodyplot
@recipe function f(tbp::threebodyplot)
    x, y, l, xlim, ylim = tbp.args
    xaxis --> ("x", xlim)
    yaxis --> ("y", ylim)
    seriestype --> :scatter
    markertype --> :o
    markercolor --> "black"
    aspect_ratio --> 1
    label --> l
    dpi --> 300
    [x], [y]
end

function anim()

    function inertial(ddu, du, u, p, t)

        μ1 = p[1,1]
        μ2 = p[2,1]
        x1 = p[:,2]
        x2 = p[:,3]
        
        r1 = sqrt((x1[1] - u[1])^2 + (x1[2] - u[2])^2 )
        r2 = sqrt((x2[1] - u[1])^2 + (x2[2] - u[2])^2 )

        ddu[1] = μ1*(x1[1] - u[1])/r1^3 + μ2*(x2[1] - u[1])/r2^3
        ddu[2] = μ1*(x1[2] - u[2])/r1^3 + μ2*(x2[2] - u[2])/r2^3

    end

    function rotating(ddu, du, u, p, t)

        μ1 = p[1]
        μ2 = p[2]
        n = p[3]

        r1 = sqrt((u[1] + μ2)^2 + u[2]^2)
        r2 = sqrt((u[1] - μ1)^2 + u[2]^2)

        ddu[1] = -(μ1*(u[1] + μ2)/r1^3 + μ2*(u[1] - μ1)/r2^3) + 2n*du[2] + n^2*u[1]
        ddu[2] = -u[2]*(μ1/r1^3 + μ2/r2^3) - 2n*du[1] + n^2*u[2]

    end

    t0 = -100.
    t1 = 150.
    tspan = (t0, t1)

    mu1 = .2
    mu2 = .8
    n = 1
    x1 = [1, 1]
    x2 = [-1, -1]

    p = zeros(2,3)
    p[1,1] = mu1
    p[2,1] = mu2
    p[:,2] = x1
    p[:,3] = x2

    du0 = zeros(2)
    u0 = zeros(2)
    u0[1] = 1

    probi = SecondOrderODEProblem(inertial, du0, u0, tspan, p, abstol=1e-8, reltol=1e-8)
    soli = solve(probi, Tsit5())

    p = zeros(3)
    p[1] = mu1
    p[2] = mu2
    p[3] = n

    du0 = zeros(2)
    u0 = zeros(2)
    u0[1] = 1

    probr = SecondOrderODEProblem(rotating, du0, u0, tspan, p, abstol=1e-8, reltol=1e-8)
    solr = solve(probr, Tsit5())

    n = min(length(soli.t), length(solr.t))

    anim = @animate for i in 1:10:n

        p1 = plot((x1[1], x1[2]), markershape=:o, markercolor="blue", label="planet 1",
                  legend=:bottomright, framestyle=:zerolines)
        p1 = plot!((x2[1], x2[2]), markershape=:o, markercolor="green", label="planet 2")
        p1 = threebodyplot!(soli[3,i], soli[4,i], "intertial", (-1.5,1.5), (-1.5,1.5))

        p2 = plot((-mu2, 0), markershape=:o, markercolor="blue",  label="planet 1",
                  legend=:bottomright, framestyle=:zerolines)
        p2 = plot!((mu1, 0), markershape=:o, markercolor="green", label="planet 2")
        p2 = threebodyplot!(solr[3,i], solr[4,i], "rotating", (-1, 1), (-1, 1))

        plot(p1, p2, layout=2)
    end

    gif(anim, "de_anim_15.gif", fps=15)

end

anim()