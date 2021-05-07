using Plots
using DifferentialEquations

@userplot LorenzPlot
@recipe function f(lp::LorenzPlot)
    x, y, z, i = lp.args
    n = length(x)
    inds = circshift(1:n, 1-i)
    seriesalpha --> range(0, 1, length=n)
    aspect_ratio --> 1
    label --> false
    x[inds], y[inds], z[inds]
end

function anim()

    function lorenz(du, u, p, t)

        du[1] = p[1]*(u[2] - u[1])
        du[2] = u[1]*(p[2] - u[3]) - u[2]
        du[3] = u[1]*u[2] - p[3]*u[3]

    end

    u0 = [1, 5, 10]
    tspan = (0, 100)
    p = (10, 28, 8/3)

    prob = ODEProblem(lorenz, u0, tspan, p, reltol=1e-10, abstol=1e-10)
    sol = solve(prob)
    n = length(sol.t)

    plt = plot3d(1, xaxis=("x", (-30, 30)), yaxis=("y", (-30, 30)), zaxis=("z", (0, 60)),
                 title="Lorenz Attractor", marker=2, markercolor="black", dpi=300)

    # anim = @animate for i in 1:n
    #     push!(plt, sol[1,i], sol[2,i], sol[3,i])
    # end
    # gif(anim, "de_anim.gif", fps=30)

    anim = @animate for i in 1:10:n
        lorenzplot(sol[1,:], sol[2,:], sol[3,:], i, c = :thermal)
    end
    gif(anim, "de_anim_60.gif", fps=60)


end



anim()

























    # anim = @animate for i in 1:10:n
    #     lorenzplot(sol[1,:], sol[2,:], sol[3,:], i)
    # end
    # gif(anim, "de_anim60.gif", fps=60)