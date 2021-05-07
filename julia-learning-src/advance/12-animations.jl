using Plots

@userplot orbitanim
@recipe function f!(oa::orbitanim)
    x, y = oa.args
    title --> "Trajectory"
    xaxis --> ("x", (-1.5,1.5))
    yaxis --> ("y", (-1.5, 1.5))
    markersize --> 2
    markercolor --> "red"
    seriestype --> :scatter
    legend --> :none
    framestyle --> :grid
    aspect_ratio --> 1
    dpi --> 300
    [x], [y]
end

function main()

    # IC
    topo = 10
    ω = 2π * topo / 60
    x0 = 1
    v0 = -x0*ω
    u0 = 1

    # equations
    x(t) = x0*cos(ω*t) + u0*sin(ω*t) / ω
    y(t) = v0*sin(ω*t) / ω

    # time frame
    t = 0:0.1:6
    n = length(t)

    xpos = x.(t)
    ypos = y.(t)

    # animation
    anim = @animate for i in 1:n

        # scatter!([xpos[i]], [ypos[i]], legend=:none, title="Trajectory",
        #         markersize=2, markercolor="blue",
        #         xaxis=("x", (-1.5,1.5)), yaxis=("y", (-1.5, 1.5)),
        #         framestyle=:grid, aspect_ratio=1, dpi=300)

        orbitanim!(xpos[i], ypos[i])
        scatter!((0, 0), markercolor="black")

    end

    gif(anim, "anim.gif", fps=15)

end

main()